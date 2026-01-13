import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/payment_web_view/binding/payment_web_view_binding.dart';
import 'package:sky_club/presentation/feature/payment_web_view/route/payment_web_view_argument.dart';
import 'package:sky_club/presentation/feature/payment_web_view/payment_web_view_view_model.dart';
import 'package:sky_club/presentation/feature/payment_web_view/route/payment_web_view_route.dart';
import 'package:sky_club/presentation/feature/payment_web_view/screen/payment_web_view_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/payment_web_view/screen/payment_web_view_mobile_landscape.dart';

class PaymentWebViewAdaptiveUi extends BaseAdaptiveUi<PaymentWebViewArgument, PaymentWebViewRoute> {
  const PaymentWebViewAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => PaymentWebViewAdaptiveUiState();
}

class PaymentWebViewAdaptiveUiState extends BaseAdaptiveUiState<PaymentWebViewArgument, PaymentWebViewRoute, PaymentWebViewAdaptiveUi, PaymentWebViewViewModel, PaymentWebViewBinding> {
  @override
  PaymentWebViewBinding binding = PaymentWebViewBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return PaymentWebViewMobilePortrait(viewModel: viewModel,checkoutUrl: widget.argument!.checkoutUrl, redirectUrl: widget.argument!.redirectUrl,);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return PaymentWebViewMobileLandscape(viewModel: viewModel, checkoutUrl: widget.argument!.checkoutUrl, redirectUrl: widget.argument!.redirectUrl,);
  }
}
