import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/core.dart';
import '../../utils/utils.dart';

part 'repo_loader_cubit.freezed.dart';
part 'repo_loader_state.dart';

@injectable
class RepoLoaderCubit extends Cubit<RepoLoaderState> {
  final QueueManager _queueManager;
  final List<Repo<dynamic>> _repos;

  RepoLoaderCubit(this._queueManager, this._repos) : super(const RepoLoaderState.initial());

  Future<void> init() async {
    try {
      emit(RepoLoaderState.loading());
      await _refreshToken();
      await Future.wait([_queueManager.init(), ..._repos.map((repo) => repo.loadAll())]);
      emit(RepoLoaderState.success());
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stackTrace);
      emit(RepoLoaderState.error(e.error));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stackTrace);
      emit(RepoLoaderState.error(AppError.unknown));
    }
  }

  Future<void> _refreshToken() async {
    try {
      if (supabase.auth.currentUser == null || supabase.auth.currentSession == null) {
        throw UnauthenticatedException();
      }
      Session session = supabase.auth.currentSession!;
      if ((session.expiresAt! - 5) < (DateTime.now().millisecondsSinceEpoch / 1000).round()) {
        BudgetLogger.instance.i("REFRESH TOKEN");
        await supabase.auth.refreshSession();
      }
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Error refreshing session", e, stackTrace);
    }
  }
}
