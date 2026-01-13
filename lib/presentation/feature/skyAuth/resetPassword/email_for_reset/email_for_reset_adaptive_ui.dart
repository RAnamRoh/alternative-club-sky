import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/email_for_reset/binding/email_for_reset_binding.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/email_for_reset/route/email_for_reset_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/email_for_reset/email_for_reset_view_model.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/email_for_reset/route/email_for_reset_route.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/email_for_reset/screen/email_for_reset_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/email_for_reset/screen/email_for_reset_mobile_landscape.dart';

class EmailForResetAdaptiveUi extends BaseAdaptiveUi<EmailForResetArgument, EmailForResetRoute> {
  const EmailForResetAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => EmailForResetAdaptiveUiState();
}

class EmailForResetAdaptiveUiState extends BaseAdaptiveUiState<EmailForResetArgument, EmailForResetRoute, EmailForResetAdaptiveUi, EmailForResetViewModel, EmailForResetBinding> {
  @override
  EmailForResetBinding binding = EmailForResetBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return EmailForResetMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return EmailForResetMobileLandscape(viewModel: viewModel);
  }
}
