import 'package:data/sessionManager/user_session_manager.dart';
import 'package:domain/repository/sky_auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/reset_password/route/reset_password_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_login/route/sky_login_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_login/route/sky_login_route.dart';
import 'package:club_alt/presentation/localization/ui_text.dart';

class ResetPasswordViewModel extends BaseViewModel<ResetPasswordArgument> {

  final oldPasswordTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();

  final ValueNotifier<bool> hasMinLength = ValueNotifier(false);
  final ValueNotifier<bool> hasUpperCase = ValueNotifier(false);
  final ValueNotifier<bool> hasLowerCase = ValueNotifier(false);
  final ValueNotifier<bool> hasNumber = ValueNotifier(false);

  final ValueNotifier<bool> passwordsMatch = ValueNotifier(true);
  final ValueNotifier<bool> oldPasswordEmpty = ValueNotifier(true);

  final ValueNotifier<bool> _isButtonEnabled = ValueNotifier(false);
  ValueNotifier<bool> get isButtonEnabled => _isButtonEnabled;

  final SkyAuthRepository authRepository;

  ResetPasswordViewModel(this.authRepository){
    _addValidationListeners();
  }

  @override
  void onViewReady({ResetPasswordArgument? argument}) {
    super.onViewReady();
  }

  void _addValidationListeners() {
    passwordTextEditingController.addListener(() {
      _validatePassword();
      _checkPasswordsMatch(); // Validate the confirm password whenever the main password changes
    });

    confirmPasswordTextEditingController.addListener(_checkPasswordsMatch); // Validate on confirm password changes

    oldPasswordTextEditingController.addListener(_checkOldPasswordEmpty);


    hasMinLength.addListener(_updateButtonState);
    hasUpperCase.addListener(_updateButtonState);
    hasLowerCase.addListener(_updateButtonState);
    hasNumber.addListener(_updateButtonState);
    passwordsMatch.addListener(_updateButtonState);
  }


  void _validatePassword() {
    final password = passwordTextEditingController.text.trim();
    hasMinLength.value = password.length >= 8;
    hasUpperCase.value = password.contains(RegExp(r'[A-Z]'));
    hasLowerCase.value = password.contains(RegExp(r'[a-z]'));
    hasNumber.value = password.contains(RegExp(r'[0-9]'));
  }

  void _checkPasswordsMatch() {
    final confirmPassword = confirmPasswordTextEditingController.text.trim();
    passwordsMatch.value = confirmPassword.isNotEmpty &&
        confirmPassword == passwordTextEditingController.text.trim();
  }

  void _checkOldPasswordEmpty() {
    oldPasswordEmpty.value = oldPasswordTextEditingController.text.trim().isEmpty;
  }

  bool get _arePasswordsValid =>
      hasMinLength.value && hasUpperCase.value && hasLowerCase.value && hasNumber.value && passwordsMatch.value && !oldPasswordEmpty.value;


  void _updateButtonState() {
    // Ensure passwordsMatch is up-to-date before computing button state
    passwordsMatch.value = confirmPasswordTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text == confirmPasswordTextEditingController.text;

    // Update button enabled state
    _isButtonEnabled.value =  _arePasswordsValid;
  }

  Future<void> onClickResetButton() async {

    await loadData(() => authRepository.changePassword(currentPassword: oldPasswordTextEditingController.text, newPassword: passwordTextEditingController.text) );

    showToast(uiText: FixedUiText(text: 'Password Updated'));
   // navigateToScreen(destination: SkyLoginRoute(arguments: SkyLoginArgument()) , isClearBackStack: true);

  }

  void navigateBackToSetting() {
    navigateBack();
  }

  Future<void> onClickToLogin() async {

    await UserSessionManager().logout();

    navigateToScreen(
      destination: SkyLoginRoute(arguments: SkyLoginArgument()),
      isClearBackStack: true,
    );
  }


}
