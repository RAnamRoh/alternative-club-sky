import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_ui_state.dart';
import 'package:sky_club/presentation/feature/destination_details/destination_details_view_model.dart';

class DestinationDetailsMobilePortrait extends StatefulWidget {
  final DestinationDetailsViewModel viewModel;

  const DestinationDetailsMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => DestinationDetailsMobilePortraitState();
}

class DestinationDetailsMobilePortraitState extends BaseUiState<DestinationDetailsMobilePortrait> {
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
