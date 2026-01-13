import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_ui_state.dart';
import 'package:sky_club/presentation/common/widget/common_widgets.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/sky_signup_view_model.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/widget/custom_checkbox.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/widget/mobile_number_field.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/widget/signup_email_text_field.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/widget/signup_mobile_text_field.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/widget/signup_name_text_field.dart';

import '../../../../values/dimens.dart';
import '../../sky_login/widget/social_button.dart';
import '../widget/signup_password_text_field.dart';

class SkySignupMobilePortrait extends StatefulWidget {
  final SkySignupViewModel viewModel;

  const SkySignupMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SkySignupMobilePortraitState();
}

class SkySignupMobilePortraitState
    extends BaseUiState<SkySignupMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      body: overflowScrollView(
        child: _signUpForm(context),
      ),
    );
  }

  Widget _signUpForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_20, vertical: Dimens.dimen_48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _createAccountText(context),
          SizedBox(height: Dimens.dimen_32),
          _signUpWith(context),
          SizedBox(height: Dimens.dimen_24),
          _emailSignUp(context),
          SizedBox(height: Dimens.dimen_16),
          _passwordValidators(context),
          SizedBox(height: Dimens.dimen_24),
          _termsAndConditions(context),
          SizedBox(height: Dimens.dimen_24),
          _signUpButton(context),
          SizedBox(height: Dimens.dimen_24),
          _haveAccount(context),
        ],
      ),
    );
  }

  Widget _createAccountText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text('Create Account',
          style: Theme.of(context).textTheme.headlineSmall),
    );
  }

  Widget _signUpWith(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Signup with', style: Theme.of(context).textTheme.bodyMedium),
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

  Widget _emailSignUp(BuildContext context) {
    return Column(
      children: [
        Text('Or Signup with email',
            style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: Dimens.dimen_16),
        _allFields(context),
      ],
    );
  }

  Widget _allFields(BuildContext context) {
    return Column(
      children: [
        _nameFields(context),
        SizedBox(height: Dimens.dimen_16),
        _emailField(context),
        SizedBox(height: Dimens.dimen_16),
        _mobileNumberField(context),
        SizedBox(height: Dimens.dimen_16),
        _passwordField(context),
        SizedBox(height: Dimens.dimen_16),
        _confirmPasswordField(context),
      ],
    );
  }

  Widget _nameFields(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _firstNameField(context)),
        SizedBox(width: Dimens.dimen_20),
        Expanded(child: _lastNameField(context)),
      ],
    );
  }

  Widget _firstNameField(BuildContext context) {
    return valueListenableBuilder(
      listenable: widget.viewModel.firstNameTextEditingController,
      builder: (context, value) => SignUpNameTextField(
          nameTextEditingController:
              widget.viewModel.firstNameTextEditingController,
          label: 'First Name *',
        showError: !widget.viewModel.firstNameNotEmpty.value,
      ),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return valueListenableBuilder(
      listenable: widget.viewModel.lastNameTextEditingController,
      builder: (context, value) => SignUpNameTextField(
          nameTextEditingController:
              widget.viewModel.lastNameTextEditingController,
          label: 'Last Name *',
        showError: !widget.viewModel.lastNameNotEmpty.value,),
    );
  }

  Widget _emailField(BuildContext context) {
    return valueListenableBuilder(
      listenable: widget.viewModel.emailTextEditingController,
      builder: (context, value) => SignUpEmailTextField(
        emailTextEditingController: widget.viewModel.emailTextEditingController,
        showError: !widget.viewModel.emailNotEmpty.value,
        isEmailValid: widget.viewModel.isEmailValid.value, // Pass the email validation state
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return valueListenableBuilder(
        listenable: widget.viewModel.passwordTextEditingController,
        builder: (context, value) => SignUpPasswordTextField(
              passwordTextEditingController:
                  widget.viewModel.passwordTextEditingController,
              label: 'Password *',
            ));
  }

  Widget _confirmPasswordField(BuildContext context) {
    return valueListenableBuilder(
        listenable: widget.viewModel.confirmPasswordTextEditingController,
        builder: (context, value) => SignUpPasswordTextField(
              passwordTextEditingController:
                  widget.viewModel.confirmPasswordTextEditingController,
              label: 'Confirm Password *',
          showError: !widget.viewModel.passwordsMatch.value,
            ));
  }

  Widget _mobileNumberField(BuildContext context) {
    return valueListenableBuilder(
      listenable: widget.viewModel.mobileNumberTextEditingController,
      builder: (context, value) => MobileNumberField(
        controller: widget.viewModel.mobileNumberTextEditingController,
        phoneNumberNotifier: widget.viewModel.phoneNumberNotifier,
        showError: !widget.viewModel.mobileNotEmpty.value,
      ),
    );
  }

  Widget _passwordValidators(BuildContext context) {
    return Column(
      children: [
        _buildValidationRow(
          'Minimum 8 characters',
          widget.viewModel.hasMinLength,
        ),
        _buildValidationRow(
          'Uppercase letter',
          widget.viewModel.hasUpperCase,
        ),
        _buildValidationRow(
          'Lowercase letter',
          widget.viewModel.hasLowerCase,
        ),
        _buildValidationRow(
          'Use of number',
          widget.viewModel.hasNumber,
        ),
      ],
    );
  }

  Widget _buildValidationRow(String text, ValueNotifier<bool> notifier) {
    return ValueListenableBuilder<bool>(
      valueListenable: notifier,
      builder: (context, isValid, child) {
        return Row(
          children: [
            Icon(
              isValid ? Icons.check_circle : Icons.cancel,
              color: isValid ? Colors.green : Colors.red,
              size: 10,
            ),
            const SizedBox(width: 8),
            Text(text, style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: Dimens.dimen_12,
            )
            ),
          ],
        );
      },
    );
  }

  Widget _termsAndConditions(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // This aligns the checkbox and text to the top
      mainAxisAlignment: MainAxisAlignment.start, // Align to the start of the row
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: widget.viewModel.isPolicyAccepted,
          builder: (context, value, _) {
            
            return CustomCheckbox(
                value: value,
                onChanged: (newValue){
                  widget.viewModel.updatePolicyAccepted(newValue);
                }
            );

          },
        ),
        SizedBox(width: Dimens.dimen_8),
        Expanded(
          child: Text(
            'By creating the account you agree to our Terms and Privacy Policy.',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: Dimens.dimen_14,
              color: Colors.grey.shade900,
            ),
            softWrap: true,
          ),
        ),
      ],
    );
  }

  Widget _signUpButton(BuildContext context) {
    return valueListenableBuilder(
      listenable: widget.viewModel.isButtonEnabled,
      builder: (context, isEnabled) {
       return MaterialButton(
          onPressed: (){
            widget.viewModel.executeSignup();
          },
          minWidth: double.infinity,
          color: isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimens.dimen_5,
              ),
            ),
          ),
          padding:
              EdgeInsets.symmetric(
                horizontal: Dimens.dimen_40,
                vertical: Dimens.dimen_10,
              ),
          child:   Text(
            'Sign Up',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Dimens.dimen_16,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }
    );
  }


  Widget _haveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Color(0xFF4F4F4F),
            fontWeight: FontWeight.w500,
            fontSize: Dimens.dimen_12,
          ),
        ),
        SizedBox(width: Dimens.dimen_8),
        _createLoginButton(context),
      ],
    );
  }

  Widget _createLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.viewModel.onHaveAccountButtonClicked();
      },
      child: Text(
        'Login',
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
