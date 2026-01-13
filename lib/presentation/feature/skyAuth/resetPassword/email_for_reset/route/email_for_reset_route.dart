import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/email_for_reset/email_for_reset_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/email_for_reset/route/email_for_reset_argument.dart';

class EmailForResetRoute extends BaseRoute<EmailForResetArgument> {
  @override
  RoutePath routePath = RoutePath.emailForReset;

  EmailForResetRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => EmailForResetAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
