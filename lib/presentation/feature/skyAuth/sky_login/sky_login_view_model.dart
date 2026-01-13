

import 'package:domain/repository/sky_auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/common/extension/context_ext.dart';
import 'package:club_alt/presentation/feature/auth/validator/email_validator.dart';
import 'package:club_alt/presentation/feature/auth/validator/password_validator.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/email_for_reset/route/email_for_reset_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/email_for_reset/route/email_for_reset_route.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_login/route/sky_login_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_signup/route/sky_signup_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_signup/route/sky_signup_route.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_route.dart';
import 'package:club_alt/presentation/localization/text_id.dart';
import 'package:club_alt/presentation/localization/ui_text.dart';



class SkyLoginViewModel extends BaseViewModel<SkyLoginArgument> {

  final TextEditingController emailTextEditingController =
  TextEditingController();
  final TextEditingController passwordTextEditingController =
  TextEditingController();

  ValueNotifier<bool> emailValidated = ValueNotifier(false);
  ValueNotifier<bool> passwordValidated = ValueNotifier(false);


  final SkyAuthRepository skyAuthRepository;

  SkyLoginViewModel({required this.skyAuthRepository});

  @override
  void onViewReady({SkyLoginArgument? argument}) {
    super.onViewReady();
  }

  @override
  void onDispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.onDispose();
  }


  String? getEmailError(BuildContext context) {
    if (emailTextEditingController.selection.baseOffset == -1) return null;
    EmailValidationError? emailError =
    EmailValidator.getValidationError(emailTextEditingController.text);
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

  String? getPasswordError() {
    if (passwordTextEditingController.selection.baseOffset == -1) return null;
    PasswordValidationError? passwordError = PasswordValidator.getValidationError(passwordTextEditingController.text);
    if (passwordError == null) return null;
    if (passwordError == PasswordValidationError.empty) {
      return "Password is empty";
    }
    return null;
  }

  void onForgotPasswordButtonClicked() {
    navigateToScreen(destination: EmailForResetRoute(arguments: EmailForResetArgument()));
  }


  bool _validateEmail() {
    bool emailValidation = EmailValidator.isValid(emailTextEditingController.text);
    return emailValidation;
  }

  bool _validatePassword() {
    bool passwordValidation = passwordTextEditingController.text.isNotEmpty;
    return passwordValidation;
  }

  Future<void> onSignInButtonClicked() async {
    if (!_validateEmail() ||
        !_validatePassword()) {
      showToast(
        uiText: DynamicUiText(
          textId: PleaseFillUpAllTheRequiredFieldsTextId(),
          fallbackText: "Please fill up all fields",
        ),
      );
      return;
    }

    final email = emailTextEditingController.text;
    final password = passwordTextEditingController.text;
    await loadData(() => skyAuthRepository.login(email: email, password: password));

    navigateToScreen(destination: SkybaseRoute(arguments: SkybaseArgument()), isClearBackStack: true);


  }

  void onCreateAnAccountButtonClicked() {
    navigateToScreen(destination: SkySignupRoute(arguments: SkySignupArgument()));
  }

  void onSkipClicked(){
    navigateToScreen(destination: SkybaseRoute(arguments: SkybaseArgument()), isClearBackStack: true);
  }


}
