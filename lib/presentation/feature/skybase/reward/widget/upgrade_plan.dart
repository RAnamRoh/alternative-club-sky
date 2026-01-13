import 'package:domain/enum/subscription_bill.dart';
import 'package:domain/enum/subscription_level.dart';
import 'package:domain/model/skyClubModels/subscription_state.dart';
import 'package:domain/model/skyClubModels/subscription_type_domain.dart';
import 'package:domain/model/skyClubModels/user_subscription_domain.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/common/widget/common_widgets.dart';
import 'package:club_alt/presentation/feature/skybase/reward/reward_view_model.dart';
import 'package:club_alt/presentation/feature/skybase/reward/widget/plan_tile.dart';
import 'package:club_alt/presentation/feature/skybase/reward/widget/purchase_sub_dialogue.dart';

import 'package:club_alt/presentation/values/dimens.dart';

class UpgradePlan extends StatelessWidget {
  final RewardViewModel viewModel;

  final UserSubscriptionDomain currentPlan;

  const UpgradePlan(
      {super.key, required this.viewModel, required this.currentPlan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: overflowScrollView(
        child: _buildUpgradePlan(context),
      ),
    );
  }

  Widget _buildUpgradePlan(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: Dimens.dimen_24,
        ),
        _buildBackButton(),
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
          _buildSubscriptionPlanButton(context),
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

  Widget _buildSubscriptionPlanButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      minWidth: double.infinity,
      color: Theme.of(context).primaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            Dimens.dimen_5,
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: Text(
        currentPlan.interval == 'month' ? 'Monthly' : 'Yearly',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
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
            height: 500,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Opacity(
                    opacity: currentPlan.type == value[index].membershipType
                        ? 0.5
                        : 1,
                    child: value[index].stripePriceId.isNotEmpty
                        ? PlanTile(
                            subscriptionType: value[index],
                            onPressed: () async {
                              if (currentPlan.type ==
                                  value[index].membershipType) {
                              } else {
                                openAlertDialog(
                                    context: context,
                                    level: value[index],
                                    isUpgrade: isSubscriptionUpgrade(
                                        subscriptionType: value[index],
                                        currentPlan: currentPlan),
                                    onCancel: () {
                                      Navigator.pop(context);
                                    },
                                    onConfirm: () {
                                      viewModel.changePlan(
                                          type: value[index].membershipType,
                                          interval: value[index].interval);
                                    },
                                    viewmodel: viewModel);
                              }
                            },
                            currentPlan: currentPlan,
                          )
                        : const SizedBox.shrink(),
                  );
                }), // Set a fixed height for the ListView
          );
        });
  }

  void openAlertDialog(
      {required BuildContext context,
      required SubscriptionTypeDomain level,
      required VoidCallback onCancel,
      required VoidCallback onConfirm,
      required RewardViewModel viewmodel,
      required bool isUpgrade}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PurchaseSubDialogue(
            viewModel: viewModel,
            level: level,
            onCancel: onCancel,
            onConfirm: onConfirm,
            isUpgrade: isUpgrade,
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

  Widget _buildBackButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              viewModel.resetUpgradePlan();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
    );
  }

  bool isSubscriptionUpgrade({
    required SubscriptionTypeDomain subscriptionType,
    required UserSubscriptionDomain? currentPlan,
  }) {
    if (currentPlan == null) return false;

    const hierarchy = {
      'Standard': 0,
      'Gold': 1,
      'Platinum': 2,
    };

    final currentRank = hierarchy[currentPlan.type] ?? -1;
    final newRank = hierarchy[subscriptionType.membershipType] ?? -1;

    return newRank > currentRank;
  }
}
