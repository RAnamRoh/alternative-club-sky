import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/searchticket/searchticket_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/searchticket/route/searchticket_argument.dart';

class SearchticketRoute extends BaseRoute<SearchticketArgument> {
  @override
  RoutePath routePath = RoutePath.searchticket;

  SearchticketRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => SearchticketAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
