part of 'main_cubit.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState.initial(int selectedIndex) = _Initial;

  const factory MainState.tabChange(int selectedIndex) = _TabChange;
}

extension MainStateExtension on MainState {
  int get selectedIndex => when(
    initial: (selectedIndex) => selectedIndex,
    tabChange: (selectedIndex) => selectedIndex,
  );
}
