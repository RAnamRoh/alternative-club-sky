import 'package:flutter/foundation.dart';
import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/feature/bookform/bookform_view_model.dart';
import 'package:club_alt/presentation/feature/payment_web_view/route/payment_web_view_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_route.dart';
import 'package:club_alt/presentation/localization/ui_text.dart';

class PaymentWebViewViewModel extends BaseViewModel<PaymentWebViewArgument> {
  PaymentWebViewViewModel();

  BookformViewModel? bookformViewModel;

  @override
  void onViewReady({PaymentWebViewArgument? argument}) {
    super.onViewReady();

    if (argument != null) {
      bookformViewModel = argument.viewModel;
    }
  }

  void navigateToBase() {
    navigateToScreen(destination: SkybaseRoute(arguments: SkybaseArgument()));
  }

  void showSuccessMessage() {
    showToast(uiText: FixedUiText(text: 'Successful'));
  }
}
