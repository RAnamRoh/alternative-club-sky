import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/destination_details/screen/destination_details_mobile_portrait.dart';

class DestinationDetailsMobileLandscape extends DestinationDetailsMobilePortrait {
  const DestinationDetailsMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => DestinationDetailsMobileLandscapeState();
}

class DestinationDetailsMobileLandscapeState extends DestinationDetailsMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: valueListenableBuilder(
        listenable: widget.viewModel.message,
        builder: (context, value) {
          return InkWell(
            child: Text('DestinationDetails: $value'),
            onTap: () => widget.viewModel.onClick(),
          );
        },
      ),
    );
  }
}
