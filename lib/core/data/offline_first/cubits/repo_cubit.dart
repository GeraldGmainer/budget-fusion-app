import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/utils.dart';
import '../../../bloc/loadable_state.dart';
import '../interfaces/repo.dart';

class RepoCubit<T> extends Cubit<LoadableState<List<T>>> {
  final Repo<T> _manager;

  RepoCubit(this._manager) : super(const LoadableState.initial()) {
    _manager.watch().listen(_onDataChange).onError((error) => BudgetLogger.instance.w(error));
  }

  void _onDataChange(List<T> data) {
    emit(LoadableState.loaded(data));
  }

  Future<void> load() async {}
}
