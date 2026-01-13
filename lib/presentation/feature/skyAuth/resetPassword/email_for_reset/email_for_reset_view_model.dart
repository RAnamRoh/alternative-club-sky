import 'package:domain/repository/sky_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/common/extension/context_ext.dart';
import 'package:sky_club/presentation/feature/auth/validator/email_validator.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/route/check_email_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/route/check_email_route.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/email_for_reset/route/email_for_reset_argument.dart';



class EmailForResetViewModel extends BaseViewModel<EmailForResetArgument> {


  final TextEditingController emailController = TextEditingController();
  final SkyAuthRepository skyAuthRepository;

  EmailForResetViewModel(this.skyAuthRepository);

  @override
  void onViewReady({EmailForResetArgument? argument}) {
    super.onViewReady();
  }

  String? getEmailError(BuildContext context) {
    if (emailController.selection.baseOffset == -1) return null;
    EmailValidationError? emailError =
    EmailValidator.getValidationError(emailController.text);
    if (emailError == null) return null;

    if (emailError == EmailValidationError.empty) {
      return context.localizations.login__login_form__email_field_empty;
    }
    if (emailError == EmailValidationError.invalid) {
      return context
          .localizations.login__login_form__email_field_invalid_email_text;
    }
    return null;
  }

  Future<void> onContinueButtonClicked() async{

    if (isValidEmail()){
      await loadData(() => skyAuthRepository.forgotPassword(email: emailController.text));
      navigateToScreen(destination: CheckEmailRoute(arguments: CheckEmailArgument()));
    }

  }

  bool isValidEmail() {
    EmailValidationError? emailError =
    EmailValidator.getValidationError(emailController.text);
    return emailError == null;
  }


}
