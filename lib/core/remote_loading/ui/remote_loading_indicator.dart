import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';
import '../bloc/remote_loading_cubit.dart';

class RemoteLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<RemoteLoadingCubit, bool, bool>(
      selector: (state) => state,
      builder: (context, isLoading) {
        return isLoading
            ? Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: LinearProgressIndicator(color: AppColors.primaryColor, minHeight: 3),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
