import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/skybase/screen/skybase_mobile_portrait.dart';

class SkybaseMobileLandscape extends SkybaseMobilePortrait {
  const SkybaseMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SkybaseMobileLandscapeState();
}

class SkybaseMobileLandscapeState extends SkybaseMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(),
    );
  }
}
