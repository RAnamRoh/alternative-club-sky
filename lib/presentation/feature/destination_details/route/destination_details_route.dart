import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/destination_details/destination_details_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/destination_details/route/destination_details_argument.dart';

class DestinationDetailsRoute extends BaseRoute<DestinationDetailsArgument> {
  @override
  RoutePath routePath = RoutePath.destinationDetails;

  DestinationDetailsRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => DestinationDetailsAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
