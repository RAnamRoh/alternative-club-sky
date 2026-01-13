import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/binding/check_email_binding.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/route/check_email_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/check_email_view_model.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/route/check_email_route.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/screen/check_email_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/screen/check_email_mobile_landscape.dart';

class CheckEmailAdaptiveUi extends BaseAdaptiveUi<CheckEmailArgument, CheckEmailRoute> {
  const CheckEmailAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => CheckEmailAdaptiveUiState();
}

class CheckEmailAdaptiveUiState extends BaseAdaptiveUiState<CheckEmailArgument, CheckEmailRoute, CheckEmailAdaptiveUi, CheckEmailViewModel, CheckEmailBinding> {
  @override
  CheckEmailBinding binding = CheckEmailBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return CheckEmailMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return CheckEmailMobileLandscape(viewModel: viewModel);
  }
}
