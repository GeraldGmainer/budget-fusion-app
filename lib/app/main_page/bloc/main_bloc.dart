import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_bloc.freezed.dart';
part 'main_event.dart';
part 'main_state.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState.initial(0)) {
    on<MainEvent>((event, emit) {
      event.map(select: (event) => _onTabSelected(emit, event.index));
    });
  }

  void _onTabSelected(Emitter<MainState> emit, int index) {
    if (index != 2) {
      emit(MainState.tabChange(index));
    }
  }
}
