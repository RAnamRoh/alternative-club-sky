import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skyhome/binding/skyhome_binding.dart';
import 'package:sky_club/presentation/feature/skyhome/route/skyhome_argument.dart';
import 'package:sky_club/presentation/feature/skyhome/skyhome_view_model.dart';
import 'package:sky_club/presentation/feature/skyhome/route/skyhome_route.dart';
import 'package:sky_club/presentation/feature/skyhome/screen/skyhome_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/skyhome/screen/skyhome_mobile_landscape.dart';

class SkyhomeAdaptiveUi extends BaseAdaptiveUi<SkyhomeArgument, SkyhomeRoute> {
  const SkyhomeAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => SkyhomeAdaptiveUiState();
}

class SkyhomeAdaptiveUiState extends BaseAdaptiveUiState<SkyhomeArgument, SkyhomeRoute, SkyhomeAdaptiveUi, SkyhomeViewModel, SkyhomeBinding> {
  @override
  SkyhomeBinding binding = SkyhomeBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return SkyhomeMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return SkyhomeMobileLandscape(viewModel: viewModel);
  }
}
