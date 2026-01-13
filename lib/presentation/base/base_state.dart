import 'package:domain/exceptions/base_exception.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/localization/ui_text.dart';

class BaseState {}

class ShowLoadingDialogBaseState extends BaseState {}

class DismissLoadingDialogBaseState extends BaseState {}

class NavigateBaseState extends BaseState {
  final BaseRoute destination;
  final bool isReplacement;
  final bool isClearBackStack;
  void Function()? onPop;

  NavigateBaseState({
    required this.destination,
    required this.isReplacement,
    this.isClearBackStack = false,
    this.onPop,
  });
}

class ShowToastBaseState extends BaseState {
  final UiText uiText;

  ShowToastBaseState({required this.uiText});
}

class HandleErrorBaseState extends BaseState {
  final BaseException baseError;
  final bool shouldShowToast;

  HandleErrorBaseState({
    required this.baseError,
    this.shouldShowToast = true,
  });
}

class ShowSessionErrorDialogueState extends BaseState {
  final IconData iconData;
  final String title;
  final String buttonName;
  final VoidCallback onPressed;

  ShowSessionErrorDialogueState({
    required this.iconData,
    required this.title,
    required this.buttonName,
    required this.onPressed,
  });
}


class NavigateBackBaseState extends BaseState {}
