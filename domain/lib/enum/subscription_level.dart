
import 'dart:ui';

export 'package:flutter/material.dart';

enum SubscriptionLevel {
  standard,
  gold,
  platinum,
}

extension SubscriptionLevelExtension on SubscriptionLevel {
  String get name {
    switch (this) {
      case SubscriptionLevel.standard:
        return 'Standard';
      case SubscriptionLevel.gold:
        return 'Gold';
      case SubscriptionLevel.platinum:
        return 'Platinum';
    }
  }

  String get pricePerMonth {
    switch (this) {
      case SubscriptionLevel.standard:
        return '25';
      case SubscriptionLevel.gold:
        return '65';
      case SubscriptionLevel.platinum:
        return '75';
    }

  }

  String get pricePerYear {
    switch (this) {
      case SubscriptionLevel.standard:
        return '300';
      case SubscriptionLevel.gold:
        return '780';
      case SubscriptionLevel.platinum:
        return '900';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case SubscriptionLevel.standard:
        return const Color(0xFF00A1CA);
      case SubscriptionLevel.gold:
        return const Color(0xFFFFA800);
      case SubscriptionLevel.platinum:
        return const Color(0xFFC2C2C2);
    }
  }


}

