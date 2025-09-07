import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils.dart';
import '../exceptions/app_error.dart';
import '../exceptions/translated_exception.dart';

abstract class ErrorHandledCubit<S> extends Cubit<S> {
  ErrorHandledCubit(super.initial);

  Future<void> safeCall<T>({required Future<T> Function() call, required void Function(T result) onSuccess, required S Function(Object e, AppError appError) onError}) async {
    try {
      final res = await call();
      onSuccess(res);
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e(runtimeType.toString(), e, stackTrace: stackTrace);
      emit(onError(e, e.error));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e(runtimeType.toString(), e, stackTrace: stackTrace);
      emit(onError(e, AppError.unknown));
    }
  }

  Future<void> safeRun({required Future<void> Function() action, required S Function(Object e, AppError appError) onError}) async {
    try {
      await action();
    } on TranslatedException catch (e, stackTrace) {
      // TODO what to log, so that sentry gets nice messages
      BudgetLogger.instance.e(e.message, e.cause, stackTrace: stackTrace);
      emit(onError(e, e.error));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e(runtimeType.toString(), e, stackTrace: stackTrace);
      emit(onError(e, AppError.unknown));
    }
  }
}
