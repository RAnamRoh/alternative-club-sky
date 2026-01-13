import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/feature/payment_web_view/payment_web_view_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/payment_web_view/route/payment_web_view_argument.dart';

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
