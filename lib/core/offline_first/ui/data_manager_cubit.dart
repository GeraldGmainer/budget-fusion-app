import 'package:bloc/bloc.dart';

import '../../../shared/shared.dart';
import '../../../utils/utils.dart';
import '../interfaces/data_manager.dart';

class DataManagerCubit<T> extends Cubit<LoadableState<List<T>>> {
  final DataManager<T> _manager;

  DataManagerCubit(this._manager) : super(const LoadableState.initial()) {
    _manager.watch().listen(_onDataChange).onError((error) => BudgetLogger.instance.w(error));
  }

  void _onDataChange(List<T> data) {
    emit(LoadableState.loaded(data));
  }

  Future<void> load() async {}
}
