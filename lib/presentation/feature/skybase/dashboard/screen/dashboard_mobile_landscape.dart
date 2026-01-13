import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/skybase/dashboard/screen/dashboard_mobile_portrait.dart';

class DashboardMobileLandscape extends DashboardMobilePortrait {
  const DashboardMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => DashboardMobileLandscapeState();
}

class DashboardMobileLandscapeState extends DashboardMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
