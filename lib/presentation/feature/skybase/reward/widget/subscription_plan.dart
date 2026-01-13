import 'package:domain/enum/subscription_bill.dart';
import 'package:domain/enum/subscription_level.dart';
import 'package:domain/model/skyClubModels/subscription_type_domain.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/common/widget/common_widgets.dart';
import 'package:club_alt/presentation/feature/skybase/reward/reward_view_model.dart';
import 'package:club_alt/presentation/feature/skybase/reward/widget/plan_tile.dart';
import 'package:club_alt/presentation/feature/skybase/reward/widget/purchase_sub_dialogue.dart';

import 'package:club_alt/presentation/values/dimens.dart';

class SubscriptionPlan extends StatelessWidget {
  final RewardViewModel viewModel;

  const SubscriptionPlan({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return overflowScrollView(
      child: _buildSubscriptionPlan(context),
    );
  }

  Widget _buildSubscriptionPlan(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: Dimens.dimen_24,
        ),
        _availablePoints(context),
        SizedBox(
          height: Dimens.dimen_24,
        ),
        _buildHeader(context),
        SizedBox(
          height: Dimens.dimen_24,
        ),
        _buildPlanTiles(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20),
      child: Column(
        children: [
          _buildSubscriptionPlanText(context),
          SizedBox(
            height: Dimens.dimen_10,
          ),
          _buildSubscriptionIntervalButton(context),
        ],
      ),
    );
  }

  Widget _buildSubscriptionPlanText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subscription Plan',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: Dimens.dimen_20,
                fontWeight: FontWeight.w500,
              ),
        ),
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys.',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }

  Widget _buildSubscriptionIntervalButton(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewModel.subscriptionBill,
      builder: (context, value, _) {
        return Row(
          children: [
            Expanded(
              child: _selectionButton(
                context: context,
                onPressed: () =>
                    viewModel.updateSubscriptionBill(SubscriptionBill.monthly),
                bill: SubscriptionBill.monthly,
                selectedBill: value,
                minWidth: 162,
              ),
            ),
            Expanded(
              child: _selectionButton(
                context: context,
                onPressed: () =>
                    viewModel.updateSubscriptionBill(SubscriptionBill.yearly),
                bill: SubscriptionBill.yearly,
                selectedBill: value,
                minWidth: 162,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _selectionButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required SubscriptionBill bill,
    required SubscriptionBill? selectedBill,
    double? minWidth,
    EdgeInsets? padding,
  }) {
    bool isSelected = bill == selectedBill;
    Color backgroundColor =
        isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent;

    Color foregroundColor =
        isSelected ? Theme.of(context).colorScheme.onPrimary : Colors.black;

    return MaterialButton(
      onPressed: onPressed,
      minWidth: minWidth,
      color: backgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            Dimens.dimen_5,
          ),
        ),
      ),
      padding: padding ?? EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: Text(
        bill.name,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: foregroundColor,
            ),
      ),
    );
  }

  Widget _buildPlanTiles(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewModel.currentSubscriptionList,
      builder: (context, value, _) {
        return SizedBox(
          height: 400, // Set a fixed height for the ListView
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: value.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return value[index].stripePriceId.isNotEmpty
                  ? PlanTile(
                      subscriptionType: value[index],
                      onPressed: () async {
                        openAlertDialog(
                            context: context,
                            level: value[index],
                            onCancel: () {
                              Navigator.pop(context);
                            },
                            onConfirm: () async {
                              await viewModel.makePayment(
                                  type: value[index].membershipType,
                                  interval: value[index].interval);
                            },
                            viewmodel: viewModel);
                      },
                    )
                  : SizedBox.shrink();
            },
          ),
        );
      },
    );
  }

  Widget _availablePoints(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_10, vertical: Dimens.dimen_16),
      margin: EdgeInsets.symmetric(
        horizontal: Dimens.dimen_20,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_10),
        color: Color(0xFFF0EFF9),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AssetImageView(
            fileName: 'trophy.svg',
            height: Dimens.dimen_45,
            width: Dimens.dimen_45,
          ),
          SizedBox(
            width: Dimens.dimen_16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Points'.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Text(
                '${viewModel.userSubscription.value?.point ?? 0}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.dimen_24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void openAlertDialog(
      {required BuildContext context,
      required SubscriptionTypeDomain level,
      required VoidCallback onCancel,
      required VoidCallback onConfirm,
      required RewardViewModel viewmodel}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PurchaseSubDialogue(
            viewModel: viewModel,
            level: level,
            onCancel: onCancel,
            onConfirm: onConfirm,
          ),
        );
      },
    );
  }

  DateTime getNextBillingDate(bool forMonth) {
    // Get the current date
    DateTime now = DateTime.now();

    // Add one month or one year based on the value of forMonth
    DateTime nextBillingDate = forMonth
        ? DateTime(now.year, now.month + 1, now.day)
        : DateTime(now.year + 1, now.month, now.day);

    // Format the date
    return nextBillingDate;
  }
}
