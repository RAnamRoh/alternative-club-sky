import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/otp_verification/screen/otp_verification_mobile_portrait.dart';

class OtpVerificationMobileLandscape extends OtpVerificationMobilePortrait {
  const OtpVerificationMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => OtpVerificationMobileLandscapeState();
}

class OtpVerificationMobileLandscapeState extends OtpVerificationMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      body: SizedBox.shrink()
    );
  }
}
