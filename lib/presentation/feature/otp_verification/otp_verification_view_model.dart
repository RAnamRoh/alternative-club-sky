import 'dart:async';

import 'package:domain/exceptions/base_exception.dart';
import 'package:domain/repository/sky_home_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/feature/otp_verification/route/otp_verification_argument.dart';
import 'package:sky_club/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:sky_club/presentation/feature/skybase/route/skybase_route.dart';

class OtpVerificationViewModel extends BaseViewModel<OtpVerificationArgument> {



  final SkyHomeRepository repository;

  OtpVerificationViewModel({required this.repository});


  TextEditingController otpController = TextEditingController();

  ValueNotifier<bool> otpIsValid = ValueNotifier<bool>(false);

  // --- ✨ New Code ---
  // 1. Add a StreamController to send error messages to the UI
  final StreamController<String> _errorController = StreamController<String>();
  Stream<String> get errorStream => _errorController.stream;




  @override
  void onViewReady({OtpVerificationArgument? argument}) {
    super.onViewReady();
  }

  void initialize() {
    otpController.addListener(
        (){
          onOtpChanged(otpController.text);
        }
    );
  }

  @override
  void onDispose() {
    _errorController.close();
    otpController.dispose();
    otpIsValid.dispose();
    super.onDispose();
  }

  String? validateOtp(String value) {

    if (value.isEmpty) {
      return 'Please enter OTP';
    }
    if (value.length != 6) {
      return 'Enter 6 digits valid OTP';
    }
    return null;
  }

  void onOtpChanged(String value) {
    otpIsValid.value = validateOtp(value) == null;
  }

  Future<void> verifyOtp() async {
    if (validateOtp(otpController.text) == null) {
      //await repository.verifyOTP(otp: otpController.text);

      try {
        await loadData(() => repository.verifyOTP(otp: otpController.text) );
        navigateToScreen(destination: SkybaseRoute(arguments: SkybaseArgument()), isClearBackStack: true);
      }  on BaseException catch (e) {
        String errorMessage = e.message;
        _errorController.add(errorMessage);
      }

    }
  }


}
