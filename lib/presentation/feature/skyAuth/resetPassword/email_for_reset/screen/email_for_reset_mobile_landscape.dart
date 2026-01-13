import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/email_for_reset/screen/email_for_reset_mobile_portrait.dart';

class EmailForResetMobileLandscape extends EmailForResetMobilePortrait {
  const EmailForResetMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => EmailForResetMobileLandscapeState();
}

class EmailForResetMobileLandscapeState extends EmailForResetMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
