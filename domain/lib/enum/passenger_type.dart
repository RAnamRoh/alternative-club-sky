import 'package:flutter/material.dart';

enum PassengerType {

  adult,
  child,
  infant

}

extension PassengerTypeExtension on PassengerType {
  String get name {
    switch (this) {
      case PassengerType.adult:
        return 'Adult';
      case PassengerType.child:
        return 'Child';
      case PassengerType.infant:
        return 'Infant';
    }
  }

  double get price {
    switch (this) {
      case PassengerType.adult:
        return 100.0;
      case PassengerType.child:
        return 50.0;
      case PassengerType.infant:
        return 20.0;
    }
  }

  String get code {
    switch (this) {
      case PassengerType.adult:
        return 'ADT';
      case PassengerType.child:
        return 'CNN';
      case PassengerType.infant:
        return 'INF';
    }
  }

  /// Returns the last selectable birthdate based on the passenger type.
  DateTime get lastSelectableDate {
    final DateTime today = DateTime.now();
    switch (this) {
      case PassengerType.adult:
        return today.subtract(const Duration(days: 11 * 365)); // At least 18 years old
      case PassengerType.child:
        return today.subtract(const Duration(days: 2 * 365)); // At least 3 years old
      case PassengerType.infant:
        return DateTime.now();
    }
  }


}