import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/skybase/account/account_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skybase/account/route/account_argument.dart';

class AccountRoute extends BaseRoute<AccountArgument> {
  @override
  RoutePath routePath = RoutePath.account;

  AccountRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => AccountAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
