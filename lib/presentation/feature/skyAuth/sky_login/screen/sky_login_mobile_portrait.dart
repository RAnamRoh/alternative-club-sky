import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_ui_state.dart';
import 'package:sky_club/presentation/common/widget/common_widgets.dart';
import 'package:sky_club/presentation/common/widget/primary_button.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/sky_login_view_model.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/widget/sky_email_text_field.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/widget/sky_password_text_field.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/widget/social_button.dart';
import 'package:sky_club/presentation/values/dimens.dart';



class SkyLoginMobilePortrait extends StatefulWidget {
  final SkyLoginViewModel viewModel;

  const SkyLoginMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SkyLoginMobilePortraitState();
}

class SkyLoginMobilePortraitState extends BaseUiState<SkyLoginMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        // actions: [
        //   TextButton(
        //     onPressed: () {
        //       widget.viewModel.onSkipClicked();
        //     },
        //     child: Text('Skip'),
        //   ),
        // ],
      ),
      body: overflowScrollView(
        child: _loginForm(BuildContext),
      ),
    );
  }

  Widget _loginForm(BuildContext) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_20, vertical: Dimens.dimen_48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _welcomeText(context),
          SizedBox(height: Dimens.dimen_40),
          _loginWith(context),
          SizedBox(height: Dimens.dimen_24),
          _emailLogin(context),
          SizedBox(height: Dimens.dimen_24),
          _forgotPasswordButton(context),
          SizedBox(height: Dimens.dimen_10),
          _signInButton(context),
          SizedBox(height: Dimens.dimen_24),
          _noAccount(context),
        ],
      ),
    );
  }

  Widget _welcomeText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Welcome Back!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          'Sign in to unlock yout next great experience.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
                fontSize: Dimens.dimen_18,
              ),
        ),
      ],
    );
  }

  Widget _loginWith(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Login With', style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: Dimens.dimen_16),
        _socialLoginOptions(context),
      ],
    );
  }

  Widget _socialLoginOptions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_8),
      child: Row(
        children: [
          Expanded(
            child: SocialButton(
              name: 'Facebook',
              imageName: 'facebook.svg',
              onTap: () {},
            ),
          ),
          SizedBox(width: Dimens.dimen_16),
          Expanded(
            child: SocialButton(
              name: 'Google',
              imageName: 'google.svg',
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _emailLogin(BuildContext context) {
    return Column(
      children: [
        Text('Or Login with email',
            style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: Dimens.dimen_16),
        emailAndPasswordFields(context),
      ],
    );
  }

  Widget emailAndPasswordFields(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _emailField(context),
        SizedBox(height: Dimens.dimen_24),
        _passwordField(context),
      ],
    );
  }

  Widget _emailField(BuildContext context) {
    return valueListenableBuilder(
      listenable: widget.viewModel.emailTextEditingController,
      builder: (context, value) => SkyEmailTextField(
        emailTextEditingController: widget.viewModel.emailTextEditingController,
        errorText: widget.viewModel.getEmailError(context),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return valueListenableBuilder(
        listenable: widget.viewModel.passwordTextEditingController,
        builder: (context, value) => SkyPasswordTextField(
              passwordTextEditingController:
                  widget.viewModel.passwordTextEditingController,
              errorText: widget.viewModel.getPasswordError(),
            ));
  }

  Widget _forgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text('Forgot Password?',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: Dimens.dimen_12,
                )),
        onPressed: () {
          widget.viewModel.onForgotPasswordButtonClicked();
        },
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return PrimaryButton(
      minWidth: double.infinity,
      label: 'Sign In to SkyClub',
      onPressed: () {
        widget.viewModel.onSignInButtonClicked();
      },
    );
  }

  Widget _noAccount(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Color(0xFF4F4F4F),
                fontWeight: FontWeight.w500,
                fontSize: Dimens.dimen_12,
              ),
        ),
        _createAccountButton(context),
      ],
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.viewModel.onCreateAnAccountButtonClicked();
      },
      child: Text(
        'Create an Account',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
              fontSize: Dimens.dimen_12,
              decoration: TextDecoration.underline,
            ),
      ),
    );
  }
}
