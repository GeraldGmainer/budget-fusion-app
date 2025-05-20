import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../use_cases/load_accounts_use_case.dart';
import '../use_cases/watch_accounts_use_case.dart';

@injectable
class AccountCubit extends Cubit<LoadableState<List<Account>>> {
  final WatchAccountsUseCase _watchAccounts;
  final LoadAccountsUseCase _loadAccounts;
  StreamSubscription? _sub;

  AccountCubit(this._watchAccounts, this._loadAccounts) : super(const LoadableState.initial()) {
    _startWatching();
  }

  void _startWatching() {
    _sub?.cancel();
    _sub = _watchAccounts().listen(
      (accounts) => emit(LoadableState.loaded(accounts)),
      onError: (error) => emit(LoadableState.error(error is TranslatedException ? error.error : AppError.unknown)),
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  Future<void> load({String? userId}) async {
    try {
      DomainLogger.instance.d(runtimeType.toString(), DomainType.account.name, "initiate load");
      emit(const LoadableState.loading());
      await _loadAccounts();
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stackTrace);
      emit(LoadableState.error(e.error));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stackTrace);
      emit(LoadableState.error(AppError.unknown));
    }
  }
}
