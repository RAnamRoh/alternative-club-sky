import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_ui_state.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/common_app_bar.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/drawer_list.dart';
import 'package:sky_club/presentation/feature/skybase/reward/reward_view_model.dart';
import 'package:sky_club/presentation/feature/skybase/reward/widget/subscribed_plan.dart';
import 'package:sky_club/presentation/feature/skybase/reward/widget/subscription_plan.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';



class RewardMobilePortrait extends StatefulWidget {
  final RewardViewModel viewModel;

  const RewardMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => RewardMobilePortraitState();
}

class RewardMobilePortraitState extends BaseUiState<RewardMobilePortrait> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      drawer: const Drawer(
        child: DrawerList(
          currentScreen: RoutePath.reward,
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: valueListenableBuilder(
        listenable: widget.viewModel.subscriptionState,
        builder: (context, subscriptionState) {
          if (subscriptionState == null) {
            // Show a fallback loader only if subscriptionState is null
            return const Center(

            );
          }

          // Display the actual content once subscriptionState is available
          if (subscriptionState.isSubscribed) {
            return SubscribedPlan(viewModel: widget.viewModel);
          } else {
            return SubscriptionPlan(viewModel: widget.viewModel);
          }
        },
      ),
    );
  }
}

