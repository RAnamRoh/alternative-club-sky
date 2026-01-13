import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PaymentOption {
  card,
  paypal,
}


extension PaymentOptionExtension on PaymentOption {
  String get name {
    switch (this) {
      case PaymentOption.card:
        return 'Credit Card';
      case PaymentOption.paypal:
        return 'PayPal';
    }
  }

  Widget get icon {
    switch (this) {
      case PaymentOption.card:
        return const Row(
          children: [
            Image(image: AssetImage("assets/images/visa.png"), height: 26),
            Image(image: AssetImage("assets/images/mastercard.png"), height: 26),
            Image(image: AssetImage("assets/images/amex.png"), height: 26),

          ],
        );
      case PaymentOption.paypal:
        return const Image(image: AssetImage("assets/images/paypal.png"), height: 26);
    }
  }


}