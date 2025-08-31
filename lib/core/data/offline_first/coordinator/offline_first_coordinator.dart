import 'dart:async';

import 'package:budget_fusion_app/core/data/offline_first/realtime/realtime_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utils/utils.dart';
import '../../../supabase/supabase.dart';
import '../interfaces/repo.dart';
import '../queue/queue_manager.dart';
import '../sync_manager/sync_manager.dart';
import 'offline_first_coordination_state.dart';

@lazySingleton
class OfflineFirstCoordinator {
  final QueueManager queueManager;
  final SyncManager syncManager;
  final RealtimeManager realtimeManager;
  final ConnectivityService _connectivityService;
  final List<Repo<dynamic>> _repos;
  final BehaviorSubject<OfflineFirstCoordinationState> _state = BehaviorSubject.seeded(OfflineFirstCoordinationState.initial);
  late final StreamSubscription<Set<String>> _queueSub;
  late final StreamSubscription<AuthState> _authSub;
  late final StreamSubscription<bool> _connectivitySub;

  Stream<OfflineFirstCoordinationState> get state => _state.stream.distinct();

  OfflineFirstCoordinationState get current => _state.value;

  OfflineFirstCoordinator(this.queueManager, this.syncManager, this.realtimeManager, this._repos, this._connectivityService);

  /// After saving an entity, we want to sync all data. But the new entity will be returned also, causing network traffic and a new stream it
  /// It would be possible to set the entity sync cursor, but there is a risk to loose data
  /// So we exclude the new entity from the sync
  void _onQueueDrainedIds(Set<String> ids) {
    BudgetLogger.instance.d("_onQueueDrainedIds");
    if (ids.isEmpty) return;
    syncManager.syncAll(excludeIds: ids);
  }

  void _onAuthStateChange(AuthState state) {
    BudgetLogger.instance.d("_onAuthStateChange ${state.event}", short: true);
    if (state.event == AuthChangeEvent.signedIn || (state.event == AuthChangeEvent.initialSession && state.session != null)) {
      _onLogin();
    }
  }

  void _onConnectivityChanged(bool isOnline) {}

  void init() {
    _queueSub = queueManager.drainedIds.listen(_onQueueDrainedIds);
    _authSub = supabase.auth.onAuthStateChange.listen(_onAuthStateChange);
    _connectivitySub = _connectivityService.onlineStream.listen(_onConnectivityChanged);
    _connectivityService.checkNow().then(_onConnectivityChanged);
    for (final repo in _repos) {
      repo.setupStreams();
    }
  }

  Future<void> _onLogin() async {
    await Future.wait([queueManager.init(), loadRepos()]);
    _state.add(_connectivityService.isOnline ? OfflineFirstCoordinationState.online : OfflineFirstCoordinationState.offline);
  }

  Future<void> loadRepos() async {
    await Future.wait(_repos.map((repo) => repo.loadAll()));
  }

  Future<void> dispose() async {
    for (final lc in _repos) {
      await lc.disposeStreams();
    }
    _queueSub.cancel();
    _authSub.cancel();
    _connectivitySub.cancel();
  }
}
