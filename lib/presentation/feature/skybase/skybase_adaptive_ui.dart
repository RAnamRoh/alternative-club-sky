import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skybase/binding/skybase_binding.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:club_alt/presentation/feature/skybase/skybase_view_model.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_route.dart';
import 'package:club_alt/presentation/feature/skybase/screen/skybase_mobile_portrait.dart';
import 'package:club_alt/presentation/feature/skybase/screen/skybase_mobile_landscape.dart';

class SkybaseAdaptiveUi extends BaseAdaptiveUi<SkybaseArgument, SkybaseRoute> {
  const SkybaseAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => SkybaseAdaptiveUiState();
}

class SkybaseAdaptiveUiState extends BaseAdaptiveUiState<SkybaseArgument, SkybaseRoute, SkybaseAdaptiveUi, SkybaseViewModel, SkybaseBinding> {
  @override
  SkybaseBinding binding = SkybaseBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return SkybaseMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return SkybaseMobileLandscape(viewModel: viewModel);
  }
}
