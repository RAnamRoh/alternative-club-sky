import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/common/widget/common_widgets.dart';
import 'package:club_alt/presentation/common/widget/primary_button.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/reset_password/reset_password_view_model.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/reset_password/widget/old_password_textField.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/reset_password/widget/success_reset_dialogue.dart';
import 'package:club_alt/presentation/values/dimens.dart';

import '../../../sky_signup/widget/signup_password_text_field.dart';

class ResetPasswordMobilePortrait extends StatefulWidget {
  final ResetPasswordViewModel viewModel;

  const ResetPasswordMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => ResetPasswordMobilePortraitState();
}

class ResetPasswordMobilePortraitState extends BaseUiState<ResetPasswordMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: overflowScrollView(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_24, vertical: Dimens.dimen_80),
      child: Column(
        children: [
            _headerText(context),
          SizedBox(height: Dimens.dimen_32),
          _oldPasswordField(context),
          SizedBox(height: Dimens.dimen_32),
          _passwordField(context),
          SizedBox(height: Dimens.dimen_24),
          _confirmPasswordField(context),
          SizedBox(height: Dimens.dimen_24),
          _passwordValidators(context),
          SizedBox(height: Dimens.dimen_24),
          _resetPasswordButton(context),
        ],
      ),
    );
  }

  Widget _headerText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Reset Password',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          textAlign: TextAlign.center,
          'We\'ve got your back! Let\'s get you back on track with a new password.',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Color(0xFF7F7F7F),
            fontSize: Dimens.dimen_18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _oldPasswordField(BuildContext context) {
    return valueListenableBuilder(
        listenable: widget.viewModel.oldPasswordEmpty,
        builder: (context, value) => OldPasswordTextField(
          passwordTextEditingController:
          widget.viewModel.oldPasswordTextEditingController,
          label: 'Old Password *',
          showError: value,
        ));
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
    return ValueListenableBuilder<bool>(
      valueListenable: widget.viewModel.passwordsMatch,
      builder: (context, passwordsMatch, child) {
        return SignUpPasswordTextField(
          passwordTextEditingController: widget.viewModel.confirmPasswordTextEditingController,
          label: 'Confirm Password *',
          showError: !passwordsMatch, // Show error if passwords do not match
        );
      },
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

  Widget _resetPasswordButton(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.viewModel.isButtonEnabled,
      builder: (context, isEnabled, child) {
        return ElevatedButton(
            onPressed: isEnabled ? () async {
                   await widget.viewModel.onClickResetButton();
                   showMyDialogue(context);
                } : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
              padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_24, vertical: Dimens.dimen_12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.dimen_8),
              ),
              minimumSize: Size(double.infinity, 40),
            ),
            child: Text('Reset Password',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: isEnabled ? Theme.of(context).colorScheme.onPrimary : Colors.white,
            ),
            ),
        );
      },
    );
  }

  void showMyDialogue(BuildContext context){
    showDialog(context: context, builder: (context){
      return Dialog(
        insetPadding: EdgeInsets.zero,
        child: SuccessResetDialogue(onDone: (){
          Navigator.of(context).pop();
          widget.viewModel.navigateBackToSetting();
        }),
      );
    });
  }


}
