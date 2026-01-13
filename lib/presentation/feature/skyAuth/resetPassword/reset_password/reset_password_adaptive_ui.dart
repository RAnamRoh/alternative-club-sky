import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/binding/reset_password_binding.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/route/reset_password_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/reset_password_view_model.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/route/reset_password_route.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/screen/reset_password_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/screen/reset_password_mobile_landscape.dart';

class ResetPasswordAdaptiveUi extends BaseAdaptiveUi<ResetPasswordArgument, ResetPasswordRoute> {
  const ResetPasswordAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => ResetPasswordAdaptiveUiState();
}

class ResetPasswordAdaptiveUiState extends BaseAdaptiveUiState<ResetPasswordArgument, ResetPasswordRoute, ResetPasswordAdaptiveUi, ResetPasswordViewModel, ResetPasswordBinding> {
  @override
  ResetPasswordBinding binding = ResetPasswordBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return ResetPasswordMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return ResetPasswordMobileLandscape(viewModel: viewModel);
  }
}
