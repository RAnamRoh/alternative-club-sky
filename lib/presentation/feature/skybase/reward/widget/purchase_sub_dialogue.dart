import 'package:domain/enum/subscription_level.dart';
import 'package:domain/model/skyClubModels/subscription_type_domain.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/skybase/reward/reward_view_model.dart';
import 'package:club_alt/presentation/values/dimens.dart';
import 'package:intl/intl.dart';

class PurchaseSubDialogue extends StatelessWidget {
  final RewardViewModel viewModel;
  final SubscriptionTypeDomain level;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final bool? isUpgrade;

  const PurchaseSubDialogue({
    super.key,
    required this.viewModel,
    required this.level,
    required this.onCancel,
    required this.onConfirm,
    this.isUpgrade,
  });

  @override
  Widget build(BuildContext context) {
    return _buildDialog(context, SubscriptionLevel.standard);
  }

  Widget _buildDialog(BuildContext context, SubscriptionLevel level) {
    return Container(
      width: 335,
      padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.dimen_16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          SizedBox(
            height: Dimens.dimen_20,
          ),
          _buildPlanDetails(context),
          SizedBox(
            height: Dimens.dimen_20,
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    if (isUpgrade == null) {
      return _forConfirmation(context);
    } else {
      return isUpgrade! ? _forUpgrade(context) : _forDowngrade(context);
    }
  }

  Widget _forUpgrade(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Upgrade Your\nSubscription?',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: Dimens.dimen_24,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: Dimens.dimen_10,
        ),
        _buildUpgradePlanDescription(context),
      ],
    );
  }

  Widget _buildUpgradePlanDescription(BuildContext context) {
    return Text(
      'Upgrade  plan for enhanced benifit and premium support',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
      textAlign: TextAlign.center,
    );
  }

  Widget _forDowngrade(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Downgrade Your\nSubscription?',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: Dimens.dimen_24,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: Dimens.dimen_10,
        ),
        _buildDowngradePlanDescription(context),
      ],
    );
  }

  Widget _buildDowngradePlanDescription(BuildContext context) {
    return Text(
      'Downgrade to miss exclusive perks and benifits',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
      textAlign: TextAlign.center,
    );
  }

  Widget _forConfirmation(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Confirm Your\nSubscription?',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: Dimens.dimen_24,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: Dimens.dimen_10,
        ),
        _buildConfirmationPlanDescription(context),
      ],
    );
  }

  Widget _buildConfirmationPlanDescription(BuildContext context) {
    return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: 'You are about to subscribe to the ',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
          children: [
            TextSpan(
                text: '${level.membershipType} Plan',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
            TextSpan(
              text: ' for AU \$',
            ),
            TextSpan(
              text: '${level.price}/${level.interval}',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            TextSpan(
              text:
                  '. This plan includes premium feautures like priority support and advanced tools',
            ),
          ],
        ));
  }

  Widget _buildPlanDetails(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF4FAFF),
        borderRadius: BorderRadius.circular(Dimens.dimen_8),
        border: Border.all(
          color: Color(0xFFCDE8FF),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildInfoRow(context, 'Plan Selected', level.membershipType),
          Divider(
            color: Color(0xFFCDE8FF),
            thickness: 1,
          ),
          _buildInfoRow(
              context, 'Price', 'AU \$${level.price}/${level.interval}'),
          Divider(
            color: Color(0xFFCDE8FF),
            thickness: 1,
          ),
          _buildInfoRow(context, 'Next Billing Date',
              getNextBillingDate(isMonthlySubscription(level))),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String title, String value) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_5).copyWith(
        left: 10,
        right: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Color(0xFF4F4F4F),
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Would you like to proceed?',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: Dimens.dimen_16,
                fontWeight: FontWeight.w400,
              ),
        ),
        SizedBox(height: Dimens.dimen_10),
        _buildButton(context,
            onPressed: onCancel, title: 'Cancel', isPrimary: false),
        _buildButton(context,
            onPressed: onConfirm, title: 'Confirm', isPrimary: true),
      ],
    );
  }

  Widget _buildButton(BuildContext context,
      {required VoidCallback onPressed,
      required String title,
      required bool isPrimary}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimen_5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isPrimary ? Theme.of(context).colorScheme.primary : Colors.grey,
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.dimen_24, vertical: Dimens.dimen_12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dimen_8),
          ),
          minimumSize: Size(double.infinity, 40),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: Dimens.dimen_18,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }

  String getNextBillingDate(bool forMonth) {
    // Get the current date
    DateTime now = DateTime.now();

    // Add one month or one year based on the value of forMonth
    DateTime nextBillingDate = forMonth
        ? DateTime(now.year, now.month + 1, now.day)
        : DateTime(now.year + 1, now.month, now.day);

    // Format the date
    return DateFormat('MMMM dd, yyyy').format(nextBillingDate);
  }

  bool isMonthlySubscription(SubscriptionTypeDomain subscriptionTypeDomain) {
    return subscriptionTypeDomain.interval == 'month';
  }
}
