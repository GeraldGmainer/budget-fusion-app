import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../queue/queue_manager.dart';

part 'offline_first_queue_cubit.freezed.dart';
part 'offline_first_queue_state.dart';

@injectable
class OfflineFirstQueueCubit extends Cubit<OfflineFirstQueueState> {
  final QueueManager _queueManager;

  OfflineFirstQueueCubit(this._queueManager) : super(const OfflineFirstQueueState.initial());

  Future<void> init() async {
    emit(const OfflineFirstQueueState.loading());
    await _queueManager.init();
    emit(const OfflineFirstQueueState.loaded());
  }
}
