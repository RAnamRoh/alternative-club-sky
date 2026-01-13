import 'dart:async';

import 'package:data/sessionManager/user_session_manager.dart';
import 'package:domain/exceptions/base_exception.dart';
import 'package:domain/exceptions/session_exception.dart';
import 'package:domain/util/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_argument.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/base/base_state.dart';
import 'package:club_alt/presentation/localization/text_id.dart';
import 'package:club_alt/presentation/localization/ui_text.dart';
import 'package:http/http.dart';

abstract class BaseViewModel<A extends BaseArgument> {
  bool isLoading = false;

  final ValueNotifier<BaseState> _baseState = ValueNotifier(BaseState());

  ValueListenable<BaseState> get baseState => _baseState;

  //This will be called from UI once the widget is fully rendered
  void onViewReady({A? argument}) {
    _onInit();
  }

  @protected
  void _onInit() async {
    await UserSessionManager().refreshTokenIfExpired();
  }

  @protected
  void onDispose() {
    _baseState.dispose();
  }

  @protected
  void showLoadingDialog() {
    if (isLoading) return;
    isLoading = true;
    _baseState.value = ShowLoadingDialogBaseState();
  }

  @protected
  void dismissLoadingDialog() {
    if (!isLoading) return;
    isLoading = false;
    _baseState.value = DismissLoadingDialogBaseState();
  }

  @protected
  void navigateToScreen({
    required BaseRoute destination,
    bool? isReplacement,
    bool? isClearBackStack,
    void Function()? onPop,
  }) {
    _baseState.value = NavigateBaseState(
      destination: destination,
      isReplacement: isReplacement ?? false,
      isClearBackStack: isClearBackStack ?? false,
      onPop: onPop,
    );
  }

  @protected
  void navigateBack() {
    _baseState.value = NavigateBackBaseState();
  }

  @protected
  void showToast({required UiText uiText}) {
    _baseState.value = ShowToastBaseState(uiText: uiText);
  }

  /// This method can be used to handle the error and show localized error message
  @protected
  void handleError({
    required BaseException baseError,
    bool shouldShowToast = true,
  }) {
    _baseState.value = HandleErrorBaseState(
      baseError: baseError,
      shouldShowToast: shouldShowToast,
    );
  }

  @protected
  void showSessionErrorDialogue(
    IconData iconData,
    String title,
    String buttonName,
    VoidCallback onPressed,
  ) {
    _baseState.value = ShowSessionErrorDialogueState(
      iconData: iconData,
      title: title,
      buttonName: buttonName,
      onPressed: onPressed,
    );
  }

  /// This method can be used to call repository methods and handle the loading and error states
  @protected
  Future<T> loadData<T>(
    Future<T> Function() function, {
    bool showLoading = true,
    bool shouldShowToast = true,
  }) async {
    try {
      if (showLoading) {
        showLoadingDialog();
      }
      final f = await function().catchError((e) {
        //This will catch the Future.error thrown from the repository
        throw e;
      });
      return f;
    } on SessionException catch (e) {
      // Handle SessionException specifically

      // handleError(
      //   baseError: e,
      //   shouldShowToast: shouldShowToast,
      // );
      Future.delayed(const Duration(seconds: 1), () {
        handleError(
          baseError: e,
          shouldShowToast: shouldShowToast,
        );
      });
      Logger.error("BaseViewModel: SessionException: Load Data Error: $e");
      return Future.error(e); // Propagate it
    } on BaseException catch (e) {
      handleError(
        baseError: e,
        shouldShowToast: shouldShowToast,
      );
      Logger.error("BaseViewModel: BaseException: Load Data Error: $e");
      return Future.error(e);
    } on Error catch (e) {
      Logger.error("BaseViewModel: Error: Load Data Error: $e");
      return Future.error(e);
    } on ClientException catch (e) {
      showToast(
        uiText: DynamicUiText(
          textId: PleaseCheckYourInternetConnection(),
          fallbackText: "Please check your internet connection",
        ),
      );
      Logger.error("BaseViewModel: ClientException Load Data Error: $e");
      return Future.error(e);
    } on Exception catch (e) {
      Logger.error("BaseViewModel: Load Data Error: $e");
      return Future.error(e);
    } finally {
      dismissLoadingDialog();
    }
  }
}
