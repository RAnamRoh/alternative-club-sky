import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/bookingdetails/screen/bookingdetails_mobile_portrait.dart';

class BookingdetailsMobileLandscape extends BookingdetailsMobilePortrait {
  const BookingdetailsMobileLandscape({required super.viewModel, super.key, required super.bookintId});

  @override
  State<StatefulWidget> createState() => BookingdetailsMobileLandscapeState();
}

class BookingdetailsMobileLandscapeState extends BookingdetailsMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
