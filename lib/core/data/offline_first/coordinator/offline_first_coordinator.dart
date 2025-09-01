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
  final QueueManager _queueManager;
  final SyncManager _syncManager;
  final RealtimeManager _realtimeManager;
  final ConnectivityService _connectivityService;
  final List<Repo<dynamic>> _repos;
  final BehaviorSubject<OfflineFirstCoordinationState> _state = BehaviorSubject.seeded(OfflineFirstCoordinationState.initial);

  Stream<OfflineFirstCoordinationState> get state => _state.stream.distinct();

  OfflineFirstCoordinationState get current => _state.value;

  OfflineFirstCoordinator(this._queueManager, this._syncManager, this._realtimeManager, this._repos, this._connectivityService);

  /// After saving an entity, we want to sync all data. But the new entity will be returned also, causing network traffic and a new stream it
  /// It would be possible to set the entity sync cursor, but there is a risk to loose data
  /// So we exclude the new entity from the sync
  void _onQueueDrainedIds(Set<String> ids) {
    if (ids.isEmpty) return;
    _syncManager.syncAll(excludeIds: ids);
  }

  void _onAuthStateChange(AuthState state) {
    final signedIn = state.event == AuthChangeEvent.signedIn || (state.event == AuthChangeEvent.initialSession && state.session != null);
    if (signedIn) {
      _onLogin();
    } else {
      _onLogout();
    }
  }

  void _onConnectivityChanged(bool isOnline) {
    _syncManager.onConnectivityChanged(isOnline);
    _queueManager.onConnectivityChanged(isOnline);
    if (isOnline && supabase.auth.currentSession != null) {
      _realtimeManager.start();
      _state.add(OfflineFirstCoordinationState.online);
    } else {
      _realtimeManager.stop();
      _state.add(OfflineFirstCoordinationState.offline);
    }
  }

  void init() {
    _queueManager.drainedIds.listen(_onQueueDrainedIds);
    supabase.auth.onAuthStateChange.listen(_onAuthStateChange);
    _connectivityService.onlineStream.listen(_onConnectivityChanged);
    _connectivityService.checkNow().then(_onConnectivityChanged);
    for (final repo in _repos) {
      repo.setupStreams();
    }
  }

  Future<void> _onLogin() async {
    await Future.wait([_queueManager.init(), loadRepos()]);
    if (_connectivityService.isOnline) _realtimeManager.start();
    _state.add(_connectivityService.isOnline ? OfflineFirstCoordinationState.online : OfflineFirstCoordinationState.offline);
  }

  Future<void> loadRepos() async {
    await Future.wait(_repos.map((repo) => repo.loadAll()));
  }

  Future<void> _onLogout() async {
    _realtimeManager.stop();
    _state.add(OfflineFirstCoordinationState.offline);
  }
}
