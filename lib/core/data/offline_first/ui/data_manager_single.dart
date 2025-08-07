import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/shared.dart';
import '../../../bloc/loadable_state.dart';
import 'data_manager_cubit.dart';

class DataManagerSingle<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T data) builder;

  const DataManagerSingle({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataManagerCubit<T>, LoadableState<List<T>>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) => builder(context, data.first),
          error: (message) => ErrorText(error: message, onReload: () => BlocProvider.of<DataManagerCubit>(context).load()),
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
