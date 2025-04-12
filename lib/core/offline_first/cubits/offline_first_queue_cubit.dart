import 'package:bloc/bloc.dart';
import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'offline_first_queue_cubit.freezed.dart';
part 'offline_first_queue_state.dart';

@injectable
class OfflineFirstQueueCubit extends Cubit<OfflineFirstQueueState> {
  final QueueManager _queueManager;

  OfflineFirstQueueCubit(this._queueManager) : super(const OfflineFirstQueueState.initial());

  init() {
    _queueManager.init();
  }
}
