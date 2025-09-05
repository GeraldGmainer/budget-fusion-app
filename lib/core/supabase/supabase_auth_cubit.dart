import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import 'supabase_auth_event.dart';
import 'supabase_auth_manager.dart';

part 'supabase_auth_cubit.freezed.dart';
part 'supabase_auth_state.dart';

@injectable
class SupabaseAuthCubit extends Cubit<SupabaseAuthState> {
  final SupabaseAuthManager manager;
  StreamSubscription<SupabaseAuthEvent>? _sub;

  SupabaseAuthCubit(this.manager) : super(const SupabaseAuthState.initial()) {
    _sub = manager.stream.listen(_onAuthChange);
  }

  void _onAuthChange(SupabaseAuthEvent event) {
    switch (event.type) {
      case SupabaseAuthType.signedOut:
        emit(const SupabaseAuthState.unauthenticated());
        break;
      case SupabaseAuthType.signedIn:
        emit(SupabaseAuthState.authenticated(event.session!));
        break;
      case SupabaseAuthType.tokenRefreshed:
        emit(SupabaseAuthState.tokenRefreshed(event.session!));
        break;
      case SupabaseAuthType.passwordRecovery:
        emit(SupabaseAuthState.passwordRecovery(event.session!));
        break;
      case SupabaseAuthType.error:
        // TODO default error message
        emit(SupabaseAuthState.error(event.message ?? 'auth_error'));
        break;
    }
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return super.close();
  }
}
