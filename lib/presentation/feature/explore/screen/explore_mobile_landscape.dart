import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/explore/screen/explore_mobile_portrait.dart';

class ExploreMobileLandscape extends ExploreMobilePortrait {
  const ExploreMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => ExploreMobileLandscapeState();
}

class ExploreMobileLandscapeState extends ExploreMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(),
    );
  }
}
