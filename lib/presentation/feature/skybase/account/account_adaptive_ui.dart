import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/skybase/account/binding/account_binding.dart';
import 'package:sky_club/presentation/feature/skybase/account/route/account_argument.dart';
import 'package:sky_club/presentation/feature/skybase/account/account_view_model.dart';
import 'package:sky_club/presentation/feature/skybase/account/route/account_route.dart';
import 'package:sky_club/presentation/feature/skybase/account/screen/account_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/skybase/account/screen/account_mobile_landscape.dart';

class AccountAdaptiveUi extends BaseAdaptiveUi<AccountArgument, AccountRoute> {
  const AccountAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => AccountAdaptiveUiState();
}

class AccountAdaptiveUiState extends BaseAdaptiveUiState<AccountArgument, AccountRoute, AccountAdaptiveUi, AccountViewModel, AccountBinding> {
  @override
  AccountBinding binding = AccountBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return AccountMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return AccountMobileLandscape(viewModel: viewModel);
  }
}
