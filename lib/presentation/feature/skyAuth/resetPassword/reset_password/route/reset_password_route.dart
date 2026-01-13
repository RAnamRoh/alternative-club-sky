import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/reset_password_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/route/reset_password_argument.dart';

class ResetPasswordRoute extends BaseRoute<ResetPasswordArgument> {
  @override
  RoutePath routePath = RoutePath.resetPassword;

  ResetPasswordRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => ResetPasswordAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
