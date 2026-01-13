import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/screen/reset_password_mobile_portrait.dart';

class ResetPasswordMobileLandscape extends ResetPasswordMobilePortrait {
  const ResetPasswordMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => ResetPasswordMobileLandscapeState();
}

class ResetPasswordMobileLandscapeState extends ResetPasswordMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
