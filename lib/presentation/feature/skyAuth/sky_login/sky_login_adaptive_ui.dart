import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/binding/sky_login_binding.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/route/sky_login_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/sky_login_view_model.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/route/sky_login_route.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/screen/sky_login_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/screen/sky_login_mobile_landscape.dart';

class SkyLoginAdaptiveUi extends BaseAdaptiveUi<SkyLoginArgument, SkyLoginRoute> {
  const SkyLoginAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => SkyLoginAdaptiveUiState();
}

class SkyLoginAdaptiveUiState extends BaseAdaptiveUiState<SkyLoginArgument, SkyLoginRoute, SkyLoginAdaptiveUi, SkyLoginViewModel, SkyLoginBinding> {
  @override
  SkyLoginBinding binding = SkyLoginBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return SkyLoginMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return SkyLoginMobileLandscape(viewModel: viewModel);
  }
}
