import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/searchticket/screen/searchticket_mobile_portrait.dart';

class SearchticketMobileLandscape extends SearchticketMobilePortrait {
  const SearchticketMobileLandscape({required super.viewModel, super.key, required super.flightDetails});

  @override
  State<StatefulWidget> createState() => SearchticketMobileLandscapeState();
}

class SearchticketMobileLandscapeState extends SearchticketMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder()
    );
  }
}
