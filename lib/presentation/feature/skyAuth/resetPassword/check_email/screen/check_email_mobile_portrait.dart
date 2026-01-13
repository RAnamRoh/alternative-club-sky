import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/common/widget/primary_button.dart';
import 'package:club_alt/presentation/common/widget/secondary_button.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/check_email/check_email_view_model.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class CheckEmailMobilePortrait extends StatefulWidget {
  final CheckEmailViewModel viewModel;

  const CheckEmailMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => CheckEmailMobilePortraitState();
}

class CheckEmailMobilePortraitState
    extends BaseUiState<CheckEmailMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_24).copyWith(
        top: 210,
      ),
      child: Column(
        children: [
          _headerText(context),
          SizedBox(height: Dimens.dimen_32),
          _backToLoginButton(context),
          SizedBox(height: Dimens.dimen_15),
          _viewEmailButton(context),
        ],
      ),
    );
  }

  Widget _headerText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Check Your Email',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          textAlign: TextAlign.center,
          'We\'ve sent you a link to reset your password. Please check your inbox (and spam folder) to continue.',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Color(0xFF7F7F7F),
                fontSize: Dimens.dimen_18,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }

  Widget _backToLoginButton(BuildContext context) {
    return SecondaryButton(
      label: 'Back to Login',
      onPressed: () {
        widget.viewModel.onClickToLogin();
      },
      minWidth: double.infinity,
    );
  }
  Widget _viewEmailButton(BuildContext context) {
    return PrimaryButton(
      label: 'View Email',
      onPressed: () {
        widget.viewModel.onClickToViewEmail();
      },
      minWidth: double.infinity,
    );
  }

}
