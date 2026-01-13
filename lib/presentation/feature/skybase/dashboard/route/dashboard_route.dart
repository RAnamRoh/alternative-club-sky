import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/skybase/dashboard/dashboard_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skybase/dashboard/route/dashboard_argument.dart';

class DashboardRoute extends BaseRoute<DashboardArgument> {
  @override
  RoutePath routePath = RoutePath.dashboard;

  DashboardRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => DashboardAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
