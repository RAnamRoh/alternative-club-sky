import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/skybase/reward/screen/reward_mobile_portrait.dart';

class RewardMobileLandscape extends RewardMobilePortrait {
  const RewardMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => RewardMobileLandscapeState();
}

class RewardMobileLandscapeState extends RewardMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
