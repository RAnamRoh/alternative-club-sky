import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/bookingdetails/page/ticket_cancel/screen/ticket_cancel_mobile_portrait.dart';

class TicketCancelMobileLandscape extends TicketCancelMobilePortrait {
  const TicketCancelMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => TicketCancelMobileLandscapeState();
}

class TicketCancelMobileLandscapeState extends TicketCancelMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      body: Placeholder(),
    );
  }
}
