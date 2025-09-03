import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart' as prov;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../utils/utils.dart';
import '../core.dart';

class SupabaseContainer extends StatefulWidget {
  final Widget child;
  final GlobalKey<NavigatorState> rootNavigatorKey;
  final ValueNotifier<bool> navReady;

  const SupabaseContainer({required this.child, required this.rootNavigatorKey, required this.navReady});

  @override
  State<SupabaseContainer> createState() => _SupabaseContainerState();
}

class _SupabaseContainerState extends State<SupabaseContainer> with SupabaseDeepLinkingMixin {
  late final StreamSubscription<AuthState> _authSubscription;
  late final VoidCallback _navReadyListener;

  @override
  void initState() {
    super.initState();
    _navReadyListener = () {
      if (!widget.navReady.value) return;
      widget.navReady.removeListener(_navReadyListener);
      _attachAuth();
    };
    widget.navReady.addListener(_navReadyListener);
    startDeeplinkObserver();
  }

  void _attachAuth() {
    _authSubscription = supabase.auth.onAuthStateChange.listen(_onAuthStateChange);
  }

  void _onAuthStateChange(AuthState state) {
    final AuthChangeEvent event = state.event;
    final Session? session = state.session;
    switch (event) {
      case AuthChangeEvent.signedOut:
        _onUnauthenticated();
        break;

      case AuthChangeEvent.signedIn:
        _onAuthenticated(session!);
        break;

      case AuthChangeEvent.passwordRecovery:
        _onPasswordRecovery(session!);
        break;

      case AuthChangeEvent.tokenRefreshed:
        _onTokenRefreshed(session!);
        break;

      case AuthChangeEvent.initialSession:
        _onInitialSession(session);
        break;

      default:
        BudgetLogger.instance.i("unhandled AuthChangeEvent: $event");
    }
  }

  void _go(String route) {
    final nav = widget.rootNavigatorKey.currentState;
    if (nav == null) return;
    scheduleMicrotask(() {
      if (!mounted) return;
      nav.pushNamedAndRemoveUntil(route, (_) => false);
    });
  }

  Future<void> _onInitialSession(Session? session) async {
    if (session == null) {
      _onUnauthenticated();
      return;
    }
    try {
      await supabase.auth.refreshSession();
    } catch (e, stackTrace) {
      BudgetLogger.instance.e(e, stackTrace);
    }
    _onAuthenticated(session);
  }

  void _onUnauthenticated() {
    BudgetLogger.instance.d("onUnauthenticated");
    _go(AppRoutes.login);
  }

  void _onAuthenticated(Session session) {
    BudgetLogger.instance.d("onAuthenticated: ${session.user.id}");
    _go(AppRoutes.main);
  }

  void _onTokenRefreshed(Session session) {
    BudgetLogger.instance.d("onTokenRefreshed: ${session.user.id}");
    // context.loadUserProfileData();
  }

  void _onPasswordRecovery(Session session) {
    BudgetLogger.instance.d("onPasswordRecovery: ${session.user}");
    // TODO reset password page
    Navigator.of(context).pushNamed(AppRoutes.passwordReset);
  }

  void _onErrorAuthenticating(String message) {
    // TODO better message for sentry
    BudgetLogger.instance.w(message);
    // String text = message;
    // if (message == "Confirmation Token not found") {
    //   text = "login.error.token_not_found";
    // } else if (message.contains("signature is invalid")) {
    //   text = "login.error.signature_invalid";
    // } else {
    //   text = "login.error.default";
    // }
    _showErrorMessage(AppError.unknown);
  }

  void _showMessage(String message) {
    final scaffoldContext = prov.Provider.of<ScaffoldProvider>(context, listen: false).scaffoldContext;
    scaffoldContext?.showSnackBar(message);
  }

  void _showErrorMessage(AppError error) {
    final scaffoldContext = prov.Provider.of<ScaffoldProvider>(context, listen: false).scaffoldContext;
    scaffoldContext?.showErrorSnackBar(error);
  }

  @override
  void dispose() {
    widget.navReady.removeListener(_navReadyListener);
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void handleDeeplink(Uri uri) {
    BudgetLogger.instance.d('onReceivedAuthDeeplink: $uri');
    final uriParameters = _parseUriParameters(uri);
    _recoverSessionFromDeeplink(uri, uriParameters['type']);
  }

  Future<void> _recoverSessionFromDeeplink(Uri uri, String? deepLinkType) async {
    BudgetLogger.instance.d("_recoverSessionFromDeeplink  / type: $deepLinkType");
    try {
      final AuthSessionUrlResponse response = await Supabase.instance.client.auth.getSessionFromUrl(uri);
      if (deepLinkType == 'recovery') {
        _onPasswordRecovery(response.session);
      } else {
        await supabase.auth.refreshSession();
        _onAuthenticated(response.session);
        if (!mounted) {
          BudgetLogger.instance.d("_recoverSessionFromDeeplink not mounted anymore");
          return;
        }
        BudgetLogger.instance.d("_recoverSessionFromDeeplink success!");
        _showMessage("sign_up.success");
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.main, (_) => false);
      }
    } on Exception catch (e) {
      _onErrorAuthenticating(e.toString());
    }
  }

  Map<String, String> _parseUriParameters(Uri uri) {
    Uri uri2 = uri;
    if (uri2.hasQuery) {
      final decoded = uri2.toString().replaceAll('#', '&');
      uri2 = Uri.parse(decoded);
    } else {
      final uriStr = uri2.toString();
      String decoded;
      // %23 is the encoded of #hash
      // support custom redirect to on flutter web
      if (uriStr.contains('/#%23')) {
        decoded = uriStr.replaceAll('/#%23', '/?');
      } else if (uriStr.contains('/#/')) {
        decoded = uriStr.replaceAll('/#/', '/').replaceAll('%23', '?');
      } else {
        decoded = uriStr.replaceAll('#', '?');
      }
      uri2 = Uri.parse(decoded);
    }
    return uri2.queryParameters;
  }

  @override
  void onErrorReceivingDeeplink(String message) {
    // TODO better message for sentry
    BudgetLogger.instance.w('onErrorReceivingDeeplink: $message');
    _onErrorAuthenticating(message);
  }
}

mixin SupabaseDeepLinkingMixin<T extends StatefulWidget> on State<T> {
  StreamSubscription? _sub;

  void startDeeplinkObserver() {
    BudgetLogger.instance.d('***** SupabaseDeepLinkingMixin startAuthObserver');
    _handleIncomingLinks();
    _handleInitialUri();
  }

  void stopDeeplinkObserver() {
    BudgetLogger.instance.d('***** SupabaseDeepLinkingMixin stopAuthObserver');
    if (_sub != null) _sub?.cancel();
  }

  /// Handle incoming links - the ones that the app will recieve from the OS
  /// while already started.
  void _handleIncomingLinks() {
    if (!kIsWeb) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      // _sub = uriLinkStream.listen(
      //   (Uri? uri) {
      //     if (mounted && uri != null) {
      //       handleDeeplink(uri);
      //     }
      //   },
      //   onError: (Object err) {
      //     if (!mounted) return;
      //     onErrorReceivingDeeplink(err.toString());
      //   },
      // );
    }
  }

  /// Handle the initial Uri - the one the app was started with
  ///
  /// **ATTENTION**: `getInitialLink`/`getInitialUri` should be handled
  /// ONLY ONCE in your app's lifetime, since it is not meant to change
  /// throughout your app's life.
  ///
  /// We handle all exceptions, since it is called from initState.
  Future<void> _handleInitialUri() async {
    // if (!SupabaseAuth.instance.shouldHandleInitialDeeplink()) return;

    try {
      // final uri = await getInitialUri();
      // if (mounted && uri != null) {
      //   handleDeeplink(uri);
      // }
    } on PlatformException {
      // Platform messages may fail but we ignore the exception
    } on FormatException catch (err) {
      if (!mounted) return;
      onErrorReceivingDeeplink(err.message);
    }
  }

  /// Callback when deeplink receiving succeeds
  void handleDeeplink(Uri uri);

  /// Callback when deeplink receiving throw error
  void onErrorReceivingDeeplink(String message);
}
