import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/skybase/reward/reward_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skybase/reward/route/reward_argument.dart';

class RewardRoute extends BaseRoute<RewardArgument> {
  @override
  RoutePath routePath = RoutePath.reward;

  RewardRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => RewardAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
