import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/skybase/account/account_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skybase/account/route/account_argument.dart';

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
