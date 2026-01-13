import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/otp_verification/otp_verification_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/otp_verification/route/otp_verification_argument.dart';

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
