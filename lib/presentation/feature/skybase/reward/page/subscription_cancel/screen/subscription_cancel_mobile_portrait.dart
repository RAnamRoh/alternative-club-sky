import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/subscription_cancel_view_model.dart';
import 'package:club_alt/presentation/feature/skybase/reward/widget/sub_cancel_screen.dart';

class SubscriptionCancelMobilePortrait extends StatefulWidget {
  final SubscriptionCancelViewModel viewModel;

  const SubscriptionCancelMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SubscriptionCancelMobilePortraitState();
}

class SubscriptionCancelMobilePortraitState extends BaseUiState<SubscriptionCancelMobilePortrait> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SubCancelScreen(viewModel: widget.viewModel,),
    );
  }
}
