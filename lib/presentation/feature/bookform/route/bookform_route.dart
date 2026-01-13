import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/bookform/bookform_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/bookform/route/bookform_argument.dart';

class BookformRoute extends BaseRoute<BookformArgument> {
  @override
  RoutePath routePath = RoutePath.bookform;

  BookformRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => BookformAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
