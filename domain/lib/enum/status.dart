
import 'package:flutter/material.dart';

enum Status{
  completed,
  requested,
  canceled,
  paid,
  cancelRequested,
}

extension StatusExtension on Status{

  String get name {
    switch (this) {
      case Status.completed:
        return "Completed";
      case Status.requested:
        return "Requested";
      case Status.canceled:
        return "Cancelled";
      case Status.paid:
        return "Paid";
      case Status.cancelRequested:
        return "Cancel Requested";
    }
  }

  Color get backgroundColor {
    switch (this) {
      case Status.completed:
        return const Color(0xFFC5F6E2);
      case Status.requested:
        return const Color(0xFFDCDEFF);
      case Status.canceled:
        return const Color(0xFFFFD9D9);
      case Status.paid:
        return const Color(0xFFC5F6E2);
      case Status.cancelRequested:
        return const Color(0xFFFFD9D9);
    }
  }

  Color get foregroundColor {
    switch (this) {
      case Status.completed:
        return const Color(0xFF0A5234);
      case Status.requested:
        return const Color(0xFF575FFF);
      case Status.canceled:
        return const Color(0xFF9B0F0F);
      case Status.paid:
        return const Color(0xFF0A5234);
      case Status.cancelRequested:
        return const Color(0xFF9B0F0F);
    }
  }


}
