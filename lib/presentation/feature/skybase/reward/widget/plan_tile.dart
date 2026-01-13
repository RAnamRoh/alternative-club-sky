import 'package:domain/enum/subscription_level.dart';
import 'package:domain/model/skyClubModels/subscription_type_domain.dart';
import 'package:domain/model/skyClubModels/user_subscription_domain.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/extension/string_ext.dart';
import 'package:club_alt/presentation/feature/skybase/reward/widget/subscription_plan.dart';
import 'package:club_alt/presentation/values/dimens.dart';

import '../../../../common/widget/primary_button.dart';

class PlanTile extends StatelessWidget {
  final VoidCallback onPressed;
  final SubscriptionTypeDomain subscriptionType;
  final UserSubscriptionDomain? currentPlan;

  PlanTile({
    super.key,
    required this.subscriptionType,
    required this.onPressed,
    this.currentPlan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimens.dimen_10),
      width: Dimens.dimen_300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_10),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 20, 24, 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.dimen_10),
          topRight: Radius.circular(Dimens.dimen_10),
        ),
        color: subscriptionType.color.isNotEmpty ? subscriptionType.color.toUpperCase().hexToColor() : Color(0xFF00A1CA),
      ),
      child: Text(
        subscriptionType.membershipType.toUpperCase(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: Dimens.dimen_18,
            color: Colors.white),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimens.dimen_10),
          bottomRight: Radius.circular(Dimens.dimen_10),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _buildPrice(context),
          _buildDetails(context),
          _buildButton(context, onPressed: onPressed),
        ],
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimen_10),
      child: Column(
        children: [
          Text(
            'AU \$${subscriptionType.price}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: Dimens.dimen_30,
                color: Theme.of(context).colorScheme.primary),
          ),
          Text(
            'Per ${subscriptionType.interval}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: Dimens.dimen_20,
                color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: subscriptionType.benefits
            .map((benefit) => _buildDetailRow(
                  context: context,
                  title: benefit.title,
                  isAvailable: benefit.isAvailable,
                ))
            .toList(),
      ),
    );
  }

  Widget _buildDetailRow(
      {required BuildContext context,
      required String title,
      required bool isAvailable}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isAvailable ? Icons.check_circle : Icons.cancel,
            color: isAvailable ? Colors.green : Colors.red,
            size: Dimens.dimen_15,
          ),
          SizedBox(
            width: Dimens.dimen_10,
          ),
          Flexible(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required VoidCallback onPressed}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_20, vertical: Dimens.dimen_20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.dimen_24, vertical: Dimens.dimen_12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dimen_8),
          ),
          minimumSize: Size(double.infinity, 40),
        ),
        child: Text(
          getTitle(subscriptionType: subscriptionType, currentPlan: currentPlan),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: Dimens.dimen_18,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }

  String getTitle({
    required SubscriptionTypeDomain subscriptionType,
    required UserSubscriptionDomain? currentPlan,
  }) {
    if (currentPlan == null) return 'Purchase';

    const hierarchy = {
      'Standard': 0,
      'Gold': 1,
      'Platinum': 2,
    };

    final currentType = currentPlan.type;
    final newType = subscriptionType.membershipType;

    final currentRank = hierarchy[currentType] ?? -1;
    final newRank = hierarchy[newType] ?? -1;

    if (newRank == currentRank) {
      return 'Current';
    } else if (newRank > currentRank) {
      return 'Upgrade';
    } else {
      return 'Downgrade';
    }
  }

}
