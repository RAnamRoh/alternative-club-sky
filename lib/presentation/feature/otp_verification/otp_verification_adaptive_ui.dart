import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/otp_verification/binding/otp_verification_binding.dart';
import 'package:club_alt/presentation/feature/otp_verification/route/otp_verification_argument.dart';
import 'package:club_alt/presentation/feature/otp_verification/otp_verification_view_model.dart';
import 'package:club_alt/presentation/feature/otp_verification/route/otp_verification_route.dart';
import 'package:club_alt/presentation/feature/otp_verification/screen/otp_verification_mobile_portrait.dart';
import 'package:club_alt/presentation/feature/otp_verification/screen/otp_verification_mobile_landscape.dart';

class OtpVerificationAdaptiveUi extends BaseAdaptiveUi<OtpVerificationArgument, OtpVerificationRoute> {
  const OtpVerificationAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => OtpVerificationAdaptiveUiState();
}

class OtpVerificationAdaptiveUiState extends BaseAdaptiveUiState<OtpVerificationArgument, OtpVerificationRoute, OtpVerificationAdaptiveUi, OtpVerificationViewModel, OtpVerificationBinding> {
  @override
  OtpVerificationBinding binding = OtpVerificationBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return OtpVerificationMobilePortrait(viewModel: viewModel, onPop: widget.argument?.onPOP,);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return OtpVerificationMobileLandscape(viewModel: viewModel);
  }
}
