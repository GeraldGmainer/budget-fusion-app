import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core.dart';

class DataManagerSingleNullable<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T? data) builder;

  const DataManagerSingleNullable({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataManagerCubit<T>, LoadableState<List<T>>>(
      builder: (context, state) {
        return state.maybeWhen(loaded: (data) => builder(context, data.first), orElse: () => builder(context, null));
      },
    );
  }
}
