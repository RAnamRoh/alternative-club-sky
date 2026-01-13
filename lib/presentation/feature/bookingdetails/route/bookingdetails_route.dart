import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/bookingdetails/bookingdetails_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/bookingdetails/route/bookingdetails_argument.dart';

class BookingdetailsRoute extends BaseRoute<BookingdetailsArgument> {
  @override
  RoutePath routePath = RoutePath.bookingdetails;

  BookingdetailsRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => BookingdetailsAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
