import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/bookingdetails/page/ticket_cancel/binding/ticket_cancel_binding.dart';
import 'package:sky_club/presentation/feature/bookingdetails/page/ticket_cancel/route/ticket_cancel_argument.dart';
import 'package:sky_club/presentation/feature/bookingdetails/page/ticket_cancel/ticket_cancel_view_model.dart';
import 'package:sky_club/presentation/feature/bookingdetails/page/ticket_cancel/route/ticket_cancel_route.dart';
import 'package:sky_club/presentation/feature/bookingdetails/page/ticket_cancel/screen/ticket_cancel_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/bookingdetails/page/ticket_cancel/screen/ticket_cancel_mobile_landscape.dart';

class TicketCancelAdaptiveUi extends BaseAdaptiveUi<TicketCancelArgument, TicketCancelRoute> {
  const TicketCancelAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => TicketCancelAdaptiveUiState();
}

class TicketCancelAdaptiveUiState extends BaseAdaptiveUiState<TicketCancelArgument, TicketCancelRoute, TicketCancelAdaptiveUi, TicketCancelViewModel, TicketCancelBinding> {
  @override
  TicketCancelBinding binding = TicketCancelBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return TicketCancelMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return TicketCancelMobileLandscape(viewModel: viewModel);
  }
}
