import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/destination_details/binding/destination_details_binding.dart';
import 'package:sky_club/presentation/feature/destination_details/route/destination_details_argument.dart';
import 'package:sky_club/presentation/feature/destination_details/destination_details_view_model.dart';
import 'package:sky_club/presentation/feature/destination_details/route/destination_details_route.dart';
import 'package:sky_club/presentation/feature/destination_details/screen/destination_details_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/destination_details/screen/destination_details_mobile_landscape.dart';

class DestinationDetailsAdaptiveUi extends BaseAdaptiveUi<DestinationDetailsArgument, DestinationDetailsRoute> {
  const DestinationDetailsAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => DestinationDetailsAdaptiveUiState();
}

class DestinationDetailsAdaptiveUiState extends BaseAdaptiveUiState<DestinationDetailsArgument, DestinationDetailsRoute, DestinationDetailsAdaptiveUi, DestinationDetailsViewModel, DestinationDetailsBinding> {
  @override
  DestinationDetailsBinding binding = DestinationDetailsBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return DestinationDetailsMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return DestinationDetailsMobileLandscape(viewModel: viewModel);
  }
}
