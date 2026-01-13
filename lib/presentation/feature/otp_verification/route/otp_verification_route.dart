import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/otp_verification/otp_verification_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/otp_verification/route/otp_verification_argument.dart';

class OtpVerificationRoute extends BaseRoute<OtpVerificationArgument> {
  @override
  RoutePath routePath = RoutePath.otpVerification;

  OtpVerificationRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => OtpVerificationAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
