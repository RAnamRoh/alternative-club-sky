import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/splash/splash_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/splash/route/splash_argument.dart';

class SplashRoute extends BaseRoute<SplashArgument> {
  @override
  RoutePath routePath = RoutePath.splash;

  SplashRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => SplashAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
