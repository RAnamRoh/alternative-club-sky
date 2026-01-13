import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/payment_web_view/screen/payment_web_view_mobile_portrait.dart';

class PaymentWebViewMobileLandscape extends PaymentWebViewMobilePortrait {

  const PaymentWebViewMobileLandscape({required super.viewModel, super.key, required super.checkoutUrl, required super.redirectUrl});

  @override
  State<StatefulWidget> createState() => PaymentWebViewMobileLandscapeState();
}

class PaymentWebViewMobileLandscapeState extends PaymentWebViewMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
