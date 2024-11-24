import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';

part 'balances_bloc.freezed.dart';

part 'balances_event.dart';

part 'balances_state.dart';

@injectable
class BalancesBloc extends Bloc<BalancesEvent, BalancesState> {
  BalancesBloc() : super(const BalancesState.initial()) {
    on<BalancesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
