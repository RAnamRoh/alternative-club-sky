import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skybase/dashboard/binding/dashboard_binding.dart';
import 'package:club_alt/presentation/feature/skybase/dashboard/route/dashboard_argument.dart';
import 'package:club_alt/presentation/feature/skybase/dashboard/dashboard_view_model.dart';
import 'package:club_alt/presentation/feature/skybase/dashboard/route/dashboard_route.dart';
import 'package:club_alt/presentation/feature/skybase/dashboard/screen/dashboard_mobile_portrait.dart';
import 'package:club_alt/presentation/feature/skybase/dashboard/screen/dashboard_mobile_landscape.dart';

class DashboardAdaptiveUi extends BaseAdaptiveUi<DashboardArgument, DashboardRoute> {
  const DashboardAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => DashboardAdaptiveUiState();
}

class DashboardAdaptiveUiState extends BaseAdaptiveUiState<DashboardArgument, DashboardRoute, DashboardAdaptiveUi, DashboardViewModel, DashboardBinding> {
  @override
  DashboardBinding binding = DashboardBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return DashboardMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return DashboardMobileLandscape(viewModel: viewModel);
  }
}
