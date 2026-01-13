import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/cancel_booking/binding/cancel_booking_binding.dart';
import 'package:club_alt/presentation/feature/cancel_booking/route/cancel_booking_argument.dart';
import 'package:club_alt/presentation/feature/cancel_booking/cancel_booking_view_model.dart';
import 'package:club_alt/presentation/feature/cancel_booking/route/cancel_booking_route.dart';
import 'package:club_alt/presentation/feature/cancel_booking/screen/cancel_booking_mobile_portrait.dart';
import 'package:club_alt/presentation/feature/cancel_booking/screen/cancel_booking_mobile_landscape.dart';

class CancelBookingAdaptiveUi extends BaseAdaptiveUi<CancelBookingArgument, CancelBookingRoute> {
  const CancelBookingAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => CancelBookingAdaptiveUiState();
}

class CancelBookingAdaptiveUiState extends BaseAdaptiveUiState<CancelBookingArgument, CancelBookingRoute, CancelBookingAdaptiveUi, CancelBookingViewModel, CancelBookingBinding> {
  @override
  CancelBookingBinding binding = CancelBookingBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return CancelBookingMobilePortrait(viewModel: viewModel, bookingId: widget.argument!.bookingId,);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return CancelBookingMobileLandscape(viewModel: viewModel, bookingId: widget.argument!.bookingId,);
  }
}
