import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/explore/explore_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/explore/route/explore_argument.dart';

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
