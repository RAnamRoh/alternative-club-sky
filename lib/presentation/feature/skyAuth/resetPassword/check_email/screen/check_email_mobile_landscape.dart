import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/screen/check_email_mobile_portrait.dart';

class CheckEmailMobileLandscape extends CheckEmailMobilePortrait {
  const CheckEmailMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => CheckEmailMobileLandscapeState();
}

class CheckEmailMobileLandscapeState extends CheckEmailMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
