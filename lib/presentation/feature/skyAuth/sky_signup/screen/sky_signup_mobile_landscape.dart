import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_signup/screen/sky_signup_mobile_portrait.dart';

class SkySignupMobileLandscape extends SkySignupMobilePortrait {
  const SkySignupMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SkySignupMobileLandscapeState();
}

class SkySignupMobileLandscapeState extends SkySignupMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
