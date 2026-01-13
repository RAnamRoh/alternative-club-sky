import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/bookingdetails/bookingdetails_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/bookingdetails/route/bookingdetails_argument.dart';

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
