import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/check_email_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/route/check_email_argument.dart';

class CheckEmailRoute extends BaseRoute<CheckEmailArgument> {
  @override
  RoutePath routePath = RoutePath.checkEmail;

  CheckEmailRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => CheckEmailAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
