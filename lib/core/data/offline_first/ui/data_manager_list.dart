import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/shared.dart';
import '../../../bloc/loadable_state.dart';
import 'data_manager_cubit.dart';

class DataManagerList<T> extends StatelessWidget {
  final Widget Function(BuildContext context, List<T> data) builder;

  const DataManagerList({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataManagerCubit<T>, LoadableState<List<T>>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) => builder(context, data),
          error: (message) => ErrorText(error: message, onReload: () => BlocProvider.of<DataManagerCubit>(context).load()),
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
