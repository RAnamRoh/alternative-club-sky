import 'package:flutter/material.dart';

enum Sex {
  male,
  female,
  undisclosed,
  undefined
}

extension SexExtension on Sex {
  String get name {
    switch (this) {
      case Sex.male:
        return 'MALE';
      case Sex.female:
        return 'FEMALE';
      case Sex.undisclosed:
        return 'UNDISCLOSED';
      case Sex.undefined:
        return 'UNDEFINED';
    }
  }

  String get code {
    switch (this) {
      case Sex.male:
        return 'M';
      case Sex.female:
        return 'F';
      case Sex.undisclosed:
        return 'U';
      case Sex.undefined:
        return 'U';
    }
  }
}