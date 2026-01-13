import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/cancel_booking/screen/cancel_booking_mobile_portrait.dart';

class CancelBookingMobileLandscape extends CancelBookingMobilePortrait {
  const CancelBookingMobileLandscape({required super.viewModel, super.key, required super.bookingId});

  @override
  State<StatefulWidget> createState() => CancelBookingMobileLandscapeState();
}

class CancelBookingMobileLandscapeState extends CancelBookingMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
