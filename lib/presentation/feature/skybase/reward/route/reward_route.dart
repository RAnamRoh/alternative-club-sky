import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/skybase/reward/reward_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skybase/reward/route/reward_argument.dart';

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
