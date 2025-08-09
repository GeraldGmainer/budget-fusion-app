import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/loadable_state.dart';
import 'repo_cubit.dart';

class RepoSingleNullable<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T? data) builder;

  const RepoSingleNullable({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoCubit<T>, LoadableState<List<T>>>(
      builder: (context, state) {
        return state.maybeWhen(loaded: (data) => builder(context, data.first), orElse: () => builder(context, null));
      },
    );
  }
}
