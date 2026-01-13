import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/cancel_booking/cancel_booking_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/cancel_booking/route/cancel_booking_argument.dart';

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
