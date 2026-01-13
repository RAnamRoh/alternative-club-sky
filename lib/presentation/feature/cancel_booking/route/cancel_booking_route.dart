import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/cancel_booking/cancel_booking_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/cancel_booking/route/cancel_booking_argument.dart';

class CancelBookingRoute extends BaseRoute<CancelBookingArgument> {
  @override
  RoutePath routePath = RoutePath.cancelBooking;

  CancelBookingRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => CancelBookingAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
