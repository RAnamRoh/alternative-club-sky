import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/skyhome/skyhome_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skyhome/route/skyhome_argument.dart';

class SkyhomeRoute extends BaseRoute<SkyhomeArgument> {
  @override
  RoutePath routePath = RoutePath.skyhome;

  SkyhomeRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => SkyhomeAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
