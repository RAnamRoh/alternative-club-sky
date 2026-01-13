import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/bookform/screen/bookform_mobile_portrait.dart';

class BookformMobileLandscape extends BookformMobilePortrait {
  const BookformMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => BookformMobileLandscapeState();
}

class BookformMobileLandscapeState extends BookformMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
