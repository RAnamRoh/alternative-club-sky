import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/skyhome/screen/skyhome_mobile_portrait.dart';

class SkyhomeMobileLandscape extends SkyhomeMobilePortrait {
  const SkyhomeMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SkyhomeMobileLandscapeState();
}

class SkyhomeMobileLandscapeState extends SkyhomeMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
