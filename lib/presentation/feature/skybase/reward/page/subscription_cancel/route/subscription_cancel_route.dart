import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/subscription_cancel_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/route/subscription_cancel_argument.dart';

class SubscriptionCancelRoute extends BaseRoute<SubscriptionCancelArgument> {
  @override
  RoutePath routePath = RoutePath.subscriptionCancel;

  SubscriptionCancelRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => SubscriptionCancelAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
