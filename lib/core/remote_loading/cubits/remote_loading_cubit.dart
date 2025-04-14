import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../service/remote_loading_service.dart';

@injectable
class RemoteLoadingCubit extends Cubit<bool> {
  final RemoteLoadingService remoteLoadingService;
  late final Stream<bool> _subscription;

  RemoteLoadingCubit(this.remoteLoadingService) : super(false) {
    _subscription = remoteLoadingService.stream;
    _subscription.listen((isLoading) {
      emit(isLoading);
    });
  }
}
