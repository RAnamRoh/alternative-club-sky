import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/explore/explore_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/explore/route/explore_argument.dart';

class ExploreRoute extends BaseRoute<ExploreArgument> {
  @override
  RoutePath routePath = RoutePath.explore;

  ExploreRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => ExploreAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
