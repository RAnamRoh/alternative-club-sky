import 'package:flutter/material.dart';

enum SpecialAssistance {
  notRequired,
  wheelchair,
  meetAndAssist,
}

extension SpecialAssistanceExtension on SpecialAssistance {
  String get name {
    switch (this) {
      case SpecialAssistance.notRequired:
        return 'Not Required';
      case SpecialAssistance.wheelchair:
        return 'Wheelchair - to/from aircraft';
      case SpecialAssistance.meetAndAssist:
        return 'Meet & Assist';
    }
  }
}