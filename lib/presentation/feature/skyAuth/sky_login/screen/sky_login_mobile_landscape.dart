import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_login/screen/sky_login_mobile_portrait.dart';

class SkyLoginMobileLandscape extends SkyLoginMobilePortrait {
  const SkyLoginMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SkyLoginMobileLandscapeState();
}

class SkyLoginMobileLandscapeState extends SkyLoginMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
