import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/sky_login_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/route/sky_login_argument.dart';

class SkyLoginRoute extends BaseRoute<SkyLoginArgument> {
  @override
  RoutePath routePath = RoutePath.skyLogin;

  SkyLoginRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => SkyLoginAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
