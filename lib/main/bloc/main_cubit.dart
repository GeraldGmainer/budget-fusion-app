import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../core/core.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

@injectable
class MainCubit extends Cubit<MainState> {
  final OfflineFirstCoordinator coordinator;
  StreamSubscription<OfflineFirstCoordinationState>? _sub;

  MainCubit(this.coordinator) : super(const MainState.initial(0)) {
    _sub = coordinator.state.listen((coordinationState) {
      final isCurrentInitialState = state.maybeWhen(initial: (_) => true, orElse: () => false);
      if (isCurrentInitialState && coordinationState != OfflineFirstCoordinationState.initial) {
        selectTab(0);
      }
    });
  }

  void selectTab(int index) {
    if (index != 2) {
      emit(MainState.tabChange(index));
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
