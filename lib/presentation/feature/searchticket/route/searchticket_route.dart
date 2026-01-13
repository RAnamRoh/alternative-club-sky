import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/searchticket/searchticket_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/searchticket/route/searchticket_argument.dart';

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
