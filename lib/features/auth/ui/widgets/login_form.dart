import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../application/login/login_cubit.dart';

class LoginForm extends StatefulWidget {
  final bool isLoading;

  const LoginForm({super.key, required this.isLoading});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    BlocProvider.of<LoginCubit>(context).init();
    if (!kReleaseMode) {
      _emailController.text = "gerald_gmainer@designium.jp";
      _passwordController.text = "aaaaaaA1";
    }
  }

  _googleLogin() {
    BlocProvider.of<LoginCubit>(context).loginGoogle();
  }

  _credentialsLogin() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    BlocProvider.of<LoginCubit>(context).loginCredentials(_emailController.text, _passwordController.text);
  }

  _forgotPassword() {
    Navigator.of(context).pushNamed(AppRoutes.forgotPassword);
  }

  _signUp() {
    Navigator.of(context).pushNamed(AppRoutes.signUp);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("login.sign_with_label".tr()),
          const SizedBox(height: AppDimensions.verticalPadding),
          _buildGoogleLogin(widget.isLoading),
          const SizedBox(height: AppDimensions.verticalPadding),
          _buildDivider(),
          const SizedBox(height: AppDimensions.verticalPadding),
          _buildEmail(widget.isLoading),
          const SizedBox(height: AppDimensions.verticalPadding),
          _buildPassword(widget.isLoading),
          const SizedBox(height: AppDimensions.verticalPadding),
          _buildForgotPassword(widget.isLoading),
          _buildLoginButton(widget.isLoading),
          const SizedBox(height: AppDimensions.verticalPadding),
          _buildSignUp(widget.isLoading),
          const SizedBox(height: AppDimensions.verticalPadding),
        ],
      ),
    );
  }

  Widget _buildGoogleLogin(bool isLoading) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(CommunityMaterialIcons.google),
        label: const Text("Google"),
        onPressed: isLoading ? null : _googleLogin,
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Container(margin: const EdgeInsets.only(right: 8), child: const Divider(color: Colors.white))),
        Text("login.or_continue_with_label".tr()),
        Expanded(child: Container(margin: const EdgeInsets.only(left: 8), child: const Divider(color: Colors.white))),
      ],
    );
  }

  Widget _buildEmail(bool isLoading) {
    return FormInputText(
      controller: _emailController,
      label: "login.email".tr(),
      validator: ValidationBuilder().email().build(),
      isLoading: isLoading,
    );
  }

  Widget _buildPassword(bool isLoading) {
    return FormInputPassword(
      controller: _passwordController,
      label: "login.password".tr(),
      validator: ValidationBuilder().required().build(),
      isLoading: isLoading,
    );
  }

  Widget _buildLoginButton(bool isLoading) {
    return SizedBox(
      width: double.infinity,
      child: FormButton(
        text: "login.login_button".tr(),
        onPressed: _credentialsLogin,
        isLoading: isLoading,
      ),
    );
  }

  Widget _buildForgotPassword(bool isLoading) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: isLoading ? null : _forgotPassword,
          child: Text("login.forgot_password_label".tr()),
        ),
      ],
    );
  }

  Widget _buildSignUp(bool isLoading) {
    return TextButton(
      onPressed: isLoading ? null : _signUp,
      child: Text("login.dont_have_account_label".tr()),
    );
  }
}
