import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/remote_loading_cubit.dart';

class RemoteLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<RemoteLoadingCubit, bool, bool>(
      selector: (state) => state,
      builder: (context, isLoading) {
        return isLoading
            ? Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
