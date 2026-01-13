import 'package:data/remote/request/sign_up_request.dart';
import 'package:domain/repository/sky_auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_signup/route/sky_signup_argument.dart';
import 'package:club_alt/presentation/localization/ui_text.dart';

class SkySignupViewModel extends BaseViewModel<SkySignupArgument> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();
  final firstNameTextEditingController = TextEditingController();
  final lastNameTextEditingController = TextEditingController();
  final mobileNumberTextEditingController = TextEditingController();

  final ValueNotifier<bool> _isPolicyAccepted = ValueNotifier(false);
  ValueNotifier<bool> get isPolicyAccepted => _isPolicyAccepted;

  final ValueNotifier<bool> isEmailValid = ValueNotifier(true);

  final ValueNotifier<PhoneNumber?> phoneNumberNotifier = ValueNotifier(null);

  final ValueNotifier<bool> hasMinLength = ValueNotifier(false);
  final ValueNotifier<bool> hasUpperCase = ValueNotifier(false);
  final ValueNotifier<bool> hasLowerCase = ValueNotifier(false);
  final ValueNotifier<bool> hasNumber = ValueNotifier(false);
  final ValueNotifier<bool> passwordsMatch = ValueNotifier(true);
  final ValueNotifier<bool> firstNameNotEmpty = ValueNotifier(true);
  final ValueNotifier<bool> lastNameNotEmpty = ValueNotifier(true);
  final ValueNotifier<bool> emailNotEmpty = ValueNotifier(true);
  final ValueNotifier<bool> mobileNotEmpty = ValueNotifier(true);
  final ValueNotifier<bool> _isButtonEnabled = ValueNotifier(false);
  ValueNotifier<bool> get isButtonEnabled => _isButtonEnabled;

  final SkyAuthRepository skyAuthRepository;

  SkySignupViewModel({required this.skyAuthRepository}) {
    _addValidationListeners();
  }

  void _addValidationListeners() {
    passwordTextEditingController.addListener(_validatePassword);
    confirmPasswordTextEditingController.addListener(_checkPasswordsMatch);

    _isPolicyAccepted.addListener(_updateButtonState);

    firstNameTextEditingController.addListener(() {
      _validateField(firstNameTextEditingController, firstNameNotEmpty);
    });
    lastNameTextEditingController.addListener(() {
      _validateField(lastNameTextEditingController, lastNameNotEmpty);
    });
    emailTextEditingController.addListener(() {
      _validateField(emailTextEditingController, emailNotEmpty);
      _validateEmail(); // Add email validation
    });
    mobileNumberTextEditingController.addListener(() {
      _validateField(mobileNumberTextEditingController, mobileNotEmpty);
    });

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

  void _validateField(TextEditingController controller, ValueNotifier<bool> notifier) {
    notifier.value = controller.text.trim().isNotEmpty;
    _updateButtonState();
  }

  bool get _arePasswordsValid =>
      hasMinLength.value && hasUpperCase.value && hasLowerCase.value && hasNumber.value && passwordsMatch.value;

  bool get _areFieldsValid =>
      firstNameNotEmpty.value && lastNameNotEmpty.value && emailNotEmpty.value && mobileNotEmpty.value;

  void _updateButtonState() {
    // Ensure passwordsMatch is up-to-date before computing button state
    passwordsMatch.value = confirmPasswordTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text == confirmPasswordTextEditingController.text;

    // Update button enabled state
    _isButtonEnabled.value = _isPolicyAccepted.value && _arePasswordsValid && _areFieldsValid &&
        isEmailValid.value;
  }

  @override
  void onDispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    firstNameTextEditingController.dispose();
    lastNameTextEditingController.dispose();
    mobileNumberTextEditingController.dispose();
    _isPolicyAccepted.dispose();
    hasMinLength.dispose();
    hasUpperCase.dispose();
    hasLowerCase.dispose();
    hasNumber.dispose();
    passwordsMatch.dispose();
    firstNameNotEmpty.dispose();
    lastNameNotEmpty.dispose();
    emailNotEmpty.dispose();
    mobileNotEmpty.dispose();
    _isButtonEnabled.dispose();
    super.onDispose();
  }

  void updatePolicyAccepted(bool value) {
    isPolicyAccepted.value = value;
  }


  Future<void> executeSignup() async {
    if (_isButtonEnabled.value) {
      final phoneNumber = phoneNumberNotifier.value;
      if (phoneNumber == null || phoneNumber.number.isEmpty) {
        debugPrint('Mobile number is invalid');
        return;
      }

      // Extract the country code (e.g., "BD") and the complete number (e.g., "+8801677397270")
      final countryCode = phoneNumber.countryISOCode; // e.g., "BD"
      final completeNumber = phoneNumber.completeNumber; // e.g., "+8801677397270"

      // Split the complete number into country code and local number
      final countryDialCode = phoneNumber.countryCode; // e.g., "+880"
      final localNumber = phoneNumber.number; // e.g., "1677397270"

      // Format the mobile number as "BD|+880-1677397270"
      final formattedMobileNumber = '$countryCode|$countryDialCode-$localNumber';

      final SignUpRequest signUpRequest = SignUpRequest(
        givenName: firstNameTextEditingController.text.trim(),
        familyName: lastNameTextEditingController.text.trim(),
        email: emailTextEditingController.text.trim(),
        phoneNumber: formattedMobileNumber, // Use the formatted number
        password: passwordTextEditingController.text.trim(),
      );

      await loadData(() => skyAuthRepository.signUp(request: signUpRequest));

      showToast(uiText: FixedUiText(text: 'Registration successful'));

      navigateBack();


    } else {
      debugPrint('Signup failed: Validation not complete.');
    }

  }

  void _validateEmail() {
    final email = emailTextEditingController.text.trim();
    // Regular expression for email validation
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    isEmailValid.value = emailRegex.hasMatch(email);
    _updateButtonState();
  }

  void onHaveAccountButtonClicked() {
    navigateBack();
  }



}

