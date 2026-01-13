import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/binding/sky_signup_binding.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/route/sky_signup_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/sky_signup_view_model.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/route/sky_signup_route.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/screen/sky_signup_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/screen/sky_signup_mobile_landscape.dart';

class SkySignupAdaptiveUi extends BaseAdaptiveUi<SkySignupArgument, SkySignupRoute> {
  const SkySignupAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => SkySignupAdaptiveUiState();
}

class SkySignupAdaptiveUiState extends BaseAdaptiveUiState<SkySignupArgument, SkySignupRoute, SkySignupAdaptiveUi, SkySignupViewModel, SkySignupBinding> {
  @override
  SkySignupBinding binding = SkySignupBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return SkySignupMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return SkySignupMobileLandscape(viewModel: viewModel);
  }
}
