import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/feature/payment_web_view/payment_web_view_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/payment_web_view/route/payment_web_view_argument.dart';

class PaymentWebViewRoute extends BaseRoute<PaymentWebViewArgument> {
  @override
  RoutePath routePath = RoutePath.paymentWebView;

  PaymentWebViewRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => PaymentWebViewAdaptiveUi(
        argument: arguments,
      ),
    );
  }
}
