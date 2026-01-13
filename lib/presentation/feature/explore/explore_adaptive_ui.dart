import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/explore/binding/explore_binding.dart';
import 'package:sky_club/presentation/feature/explore/route/explore_argument.dart';
import 'package:sky_club/presentation/feature/explore/explore_view_model.dart';
import 'package:sky_club/presentation/feature/explore/route/explore_route.dart';
import 'package:sky_club/presentation/feature/explore/screen/explore_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/explore/screen/explore_mobile_landscape.dart';

class ExploreAdaptiveUi extends BaseAdaptiveUi<ExploreArgument, ExploreRoute> {
  const ExploreAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => ExploreAdaptiveUiState();
}

class ExploreAdaptiveUiState extends BaseAdaptiveUiState<ExploreArgument, ExploreRoute, ExploreAdaptiveUi, ExploreViewModel, ExploreBinding> {
  @override
  ExploreBinding binding = ExploreBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return ExploreMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return ExploreMobileLandscape(viewModel: viewModel);
  }
}
