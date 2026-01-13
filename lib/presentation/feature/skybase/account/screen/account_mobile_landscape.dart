import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/skybase/account/screen/account_mobile_portrait.dart';

class AccountMobileLandscape extends AccountMobilePortrait {
  const AccountMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => AccountMobileLandscapeState();
}

class AccountMobileLandscapeState extends AccountMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
