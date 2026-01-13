import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/reset_password/widget/success_reset_dialogue.dart';
import 'package:club_alt/presentation/feature/skybase/account/account_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skybase/dashboard/dashboard_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skybase/reward/reward_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/skybase/reward/widget/cancel_sub_dialogue.dart';
import 'package:club_alt/presentation/feature/skyhome/skyhome_adaptive_ui.dart';

enum SkyNavigationItemType {
  home,
  dashboard,
  reward,
  account;

  IconData get icon {
    switch (this) {
      case SkyNavigationItemType.home:
        return Icons.home_filled;
      case SkyNavigationItemType.dashboard:
        return Icons.dashboard;
      case SkyNavigationItemType.reward:
        return Icons.stars;
      case SkyNavigationItemType.account:
        return Icons.account_circle_outlined;
    }
  }

  IconData get selectedIcon {
    switch (this) {
      case SkyNavigationItemType.home:
        return Icons.home;
      case SkyNavigationItemType.dashboard:
        return Icons.dashboard;
      case SkyNavigationItemType.reward:
        return Icons.stars;
      case SkyNavigationItemType.account:
        return Icons.account_circle;
    }
  }

  Widget get page {
    switch (this) {
      case SkyNavigationItemType.home:
        return SkyhomeAdaptiveUi();
      case SkyNavigationItemType.dashboard:
        return DashboardAdaptiveUi();
      case SkyNavigationItemType.reward:
        return RewardAdaptiveUi();
      case SkyNavigationItemType.account:
        return AccountAdaptiveUi();
    }
  }

  String getNames() {
    switch (this) {
      case SkyNavigationItemType.home:
        return 'Home';
      case SkyNavigationItemType.dashboard:
        return 'Dashboard';
      case SkyNavigationItemType.reward:
        return 'Reward';
      case SkyNavigationItemType.account:
        return 'Account';
    }
  }
}
