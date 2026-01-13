import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/skybase/skybase_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skybase/route/skybase_argument.dart';

class SkybaseRoute extends BaseRoute<SkybaseArgument> {
  @override
  RoutePath routePath = RoutePath.skybase;

  SkybaseRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => SkybaseAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
