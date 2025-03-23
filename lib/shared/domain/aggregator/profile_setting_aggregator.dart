import 'dart:async';
import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileSettingAggregator {
  final ProfileSettingRepo _repo;
  ProfileSetting? _cache;
  late final StreamSubscription<ProfileSetting> _subscription;
  final Completer<void> _firstCompleter = Completer<void>();

  ProfileSettingAggregator(this._repo) {
    _subscription = _repo.watch().listen((profileSetting) {
      _cache = profileSetting;
      if (!_firstCompleter.isCompleted) {
        _firstCompleter.complete();
      }
    });
  }

  Future<ProfileSetting> getProfileSetting() async {
    if (_cache != null) return _cache!;
    await _firstCompleter.future;
    return _cache!;
  }

  // TODO call dispose
  void dispose() {
    _subscription.cancel();
  }
}
