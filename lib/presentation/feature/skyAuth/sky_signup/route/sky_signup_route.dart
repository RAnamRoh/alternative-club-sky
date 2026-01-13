import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_signup/sky_signup_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_signup/route/sky_signup_argument.dart';

class SkySignupRoute extends BaseRoute<SkySignupArgument> {
  @override
  RoutePath routePath = RoutePath.skySignup;

  SkySignupRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => SkySignupAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
