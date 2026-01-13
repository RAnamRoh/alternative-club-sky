import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/common/widget/primary_button.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/email_for_reset/email_for_reset_view_model.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_login/widget/sky_email_text_field.dart';
import 'package:club_alt/presentation/values/dimens.dart';



class EmailForResetMobilePortrait extends StatefulWidget {
  final EmailForResetViewModel viewModel;

  const EmailForResetMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => EmailForResetMobilePortraitState();
}

class EmailForResetMobilePortraitState
    extends BaseUiState<EmailForResetMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_24, vertical: Dimens.dimen_48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _headerText(context),
          SizedBox(height: Dimens.dimen_32),
          _emailTextField(context),
          SizedBox(height: Dimens.dimen_24),
          _continueButton(context),
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
          'Enter the email address associated with account and we\'ll send you a link to reset your password.',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Color(0xFF7F7F7F),
                fontSize: Dimens.dimen_18,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }

  Widget _emailTextField(BuildContext context) {
    return valueListenableBuilder(
        listenable: widget.viewModel.emailController,
        builder: (context, value) {
          return SkyEmailTextField(
            emailTextEditingController: widget.viewModel.emailController,
            errorText: widget.viewModel.getEmailError(context),
          );
        });
  }

  Widget _continueButton(BuildContext context) {
    return PrimaryButton(
      label: 'Continue',
      onPressed: () {
        widget.viewModel.onContinueButtonClicked();
      },
      minWidth: double.infinity,
    );
  }
}
