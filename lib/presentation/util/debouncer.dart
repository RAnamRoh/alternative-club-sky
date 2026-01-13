
import 'dart:async';
import 'package:flutter/material.dart';

class Debouncer {
  static Timer? _timer;

  static void debounce({
    required int milliseconds,
    required VoidCallback action,
  }) {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}