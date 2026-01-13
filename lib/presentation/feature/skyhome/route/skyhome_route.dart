import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/skyhome/skyhome_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skyhome/route/skyhome_argument.dart';

class SkyhomeRoute extends BaseRoute<SkyhomeArgument> {
  @override
  RoutePath routePath = RoutePath.skyhome;

  SkyhomeRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => SkyhomeAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
