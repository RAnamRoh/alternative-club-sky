import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/bookingdetails/page/ticket_cancel/ticket_cancel_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/bookingdetails/page/ticket_cancel/route/ticket_cancel_argument.dart';

class TicketCancelRoute extends BaseRoute<TicketCancelArgument> {
  @override
  RoutePath routePath = RoutePath.ticketCancel;

  TicketCancelRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => TicketCancelAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
