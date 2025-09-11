import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

@injectable
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial(0));

  void selectTab(int index) {
    emit(MainState.tabChange(index));
  }
}
