import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/shared.dart';
import '../../../bloc/loadable_state.dart';
import 'repo_cubit.dart';

class RepoSingle<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T data) builder;

  const RepoSingle({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoCubit<T>, LoadableState<List<T>>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) => builder(context, data.first),
          error: (message) => ErrorText(error: message, onReload: () => BlocProvider.of<RepoCubit>(context).load()),
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
