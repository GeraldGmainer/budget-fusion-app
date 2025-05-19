import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../auth.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  initState() {
    super.initState();
    context.read<LoginCubit>().init();
  }

  _onProfileSuccess(Profile profile) {
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.main, (_) => false);
  }

  _onError(AppError error) {
    context.showErrorSnackBar(error);
    context.read<LoginCubit>().logout();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldProvider = Provider.of<ScaffoldProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("auth.login.title".tr())),
      body: Builder(
        builder: (ctx) {
          scaffoldProvider.setScaffoldContext((ctx));

          return BlocConsumer<ProfileCubit, LoadableState<Profile>>(
            listener: (context, state) {
              state.whenOrNull(loaded: _onProfileSuccess, error: _onError);
            },
            builder: (context, state1) {
              return BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  state.whenOrNull(error: _onError);
                },
                builder: (context, state2) {
                  final isProfileLoading = state1.isLoading;
                  final isLoginLoading = state2 is LoginLoadingState || state2 is LoginSuccessState;

                  return SingleChildScrollView(
                    child: Container(
                      width: AppDimensions.formWidth,
                      padding: AppDimensions.formPadding,
                      child: Column(
                        children: [
                          Image.asset('assets/logo.png', height: 100),
                          const SizedBox(height: 20),
                          LoginForm(isLoading: isLoginLoading || isProfileLoading),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
