import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skybase/reward/binding/reward_binding.dart';
import 'package:club_alt/presentation/feature/skybase/reward/route/reward_argument.dart';
import 'package:club_alt/presentation/feature/skybase/reward/reward_view_model.dart';
import 'package:club_alt/presentation/feature/skybase/reward/route/reward_route.dart';
import 'package:club_alt/presentation/feature/skybase/reward/screen/reward_mobile_portrait.dart';
import 'package:club_alt/presentation/feature/skybase/reward/screen/reward_mobile_landscape.dart';

class RewardAdaptiveUi extends BaseAdaptiveUi<RewardArgument, RewardRoute> {
  const RewardAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => RewardAdaptiveUiState();
}

class RewardAdaptiveUiState extends BaseAdaptiveUiState<RewardArgument, RewardRoute, RewardAdaptiveUi, RewardViewModel, RewardBinding> {
  @override
  RewardBinding binding = RewardBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return RewardMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return RewardMobileLandscape(viewModel: viewModel);
  }
}
