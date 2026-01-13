import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/binding/subscription_cancel_binding.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/route/subscription_cancel_argument.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/subscription_cancel_view_model.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/route/subscription_cancel_route.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/screen/subscription_cancel_mobile_portrait.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/screen/subscription_cancel_mobile_landscape.dart';

class SubscriptionCancelAdaptiveUi extends BaseAdaptiveUi<SubscriptionCancelArgument, SubscriptionCancelRoute> {
  const SubscriptionCancelAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => SubscriptionCancelAdaptiveUiState();
}

class SubscriptionCancelAdaptiveUiState extends BaseAdaptiveUiState<SubscriptionCancelArgument, SubscriptionCancelRoute, SubscriptionCancelAdaptiveUi, SubscriptionCancelViewModel, SubscriptionCancelBinding> {
  @override
  SubscriptionCancelBinding binding = SubscriptionCancelBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return SubscriptionCancelMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return SubscriptionCancelMobileLandscape(viewModel: viewModel);
  }
}
