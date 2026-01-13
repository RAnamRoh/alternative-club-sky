import 'package:domain/enum/subscription_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/feature/skybase/reward/reward_view_model.dart';
import 'package:club_alt/presentation/feature/skybase/reward/widget/cancel_sub_dialogue.dart';
import 'package:club_alt/presentation/feature/skybase/reward/widget/upgrade_plan.dart';
import 'package:club_alt/presentation/util/date_to_string.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class SubscribedPlan extends StatelessWidget {
  final RewardViewModel viewModel;

  const SubscribedPlan({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
          valueListenable: viewModel.wantUpgrade,
          builder: (context, wantUpgrade, _) {
            return wantUpgrade
                ? UpgradePlan(
                    viewModel: viewModel,
                    currentPlan: viewModel.userSubscription.value!)
                : _buildSubscribedPlan(context);
          }),
    );
  }

  Widget _buildSubscribedPlan(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _availablePoints(context),
            SizedBox(
              height: Dimens.dimen_20,
            ),
            _buildSubscriptionPlanText(context),
            SizedBox(
              height: Dimens.dimen_20,
            ),
            _subscriptionPlan(context),
            SizedBox(
              height: Dimens.dimen_20,
            ),
            _billingDate(context),
            SizedBox(
              height: Dimens.dimen_20,
            ),
            _generateRefferal(context),
            SizedBox(
              height: Dimens.dimen_20,
            ),
            _cancelPlanButton(context),
          ],
        ),
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
                fontSize: Dimens.dimen_20.sp,
                fontWeight: FontWeight.w500,
              ),
        ),
        Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys.',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: Dimens.dimen_14.sp,
                )),
      ],
    );
  }

  Widget _subscriptionPlan(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_10.r),
        color: const Color(0xFFF0EFF9),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Subscription Plan:',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.dimen_22.sp,
                    ),
              ),
              const Spacer(),
              _valueTile(
                  title: viewModel.userSubscription.value?.type ?? '',
                  color: getColor(viewModel.userSubscription.value?.type ?? ''),
                  context: context)
            ],
          ),
          SizedBox(
            height: Dimens.dimen_20.h,
          ),
          _customButton(
              context: context,
              title: 'Change Plan',
              onPressed: () {
                viewModel.upgradePlan();
              }),
        ],
      ),
    );
  }

  Widget _billingDate(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_10.r),
        color: const Color(0xFFF0EFF9),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Bill Date:',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.dimen_22.sp,
                    ),
              ),
              const Spacer(),
              _valueTile(
                title: DateToString.dateToMonthDayYearString(
                  viewModel.userSubscription.value?.endDate ?? DateTime.now(),
                ),
                color: const Color(0xFF00A1CA),
                context: context,
              )
            ],
          ),
          SizedBox(
            height: Dimens.dimen_20.h,
          ),
          _customButton(
              context: context, title: 'Renew Plan', onPressed: () {}),
        ],
      ),
    );
  }

  Widget _generateRefferal(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_10.r),
        color: const Color(0xFFF0EFF9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Refer User',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            'Refer User after reaching level 2',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.dimen_16.sp,
                ),
          ),
          SizedBox(
            height: Dimens.dimen_20.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: Dimens.dimen_18.h, horizontal: Dimens.dimen_20.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.dimen_5),
                border:
                    Border.all(color: Color(0xFF00A1CA), width: Dimens.dimen_1),
                color: Colors.white),
            child: SelectableText(
              'www.skyclub.com/referal/1234',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.dimen_16.sp,
                  ),
            ),
          ),
          SizedBox(
            height: Dimens.dimen_20.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimens.dimen_24.w, vertical: Dimens.dimen_12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.dimen_8),
              ),
              minimumSize: Size(double.infinity, Dimens.dimen_40.h),
            ),
            child: Text(
              'Generate Link',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: Dimens.dimen_16.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _valueTile(
      {required String title,
      required Color color,
      required BuildContext context}) {
    return Container(
      padding: EdgeInsets.fromLTRB(Dimens.dimen_10.r, Dimens.dimen_14.r,
          Dimens.dimen_10.r, Dimens.dimen_14.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_5.r),
        color: color,
      ),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Dimens.dimen_16.sp,
            ),
      ),
    );
  }

  Widget _customButton(
      {required BuildContext context,
      required String title,
      required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: Dimens.dimen_18.w, horizontal: Dimens.dimen_20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.dimen_5.r),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: Dimens.dimen_1.w),
          color: Colors.white,
        ),
        child: Text(
            textAlign: TextAlign.center,
            title,
            style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }

  Widget _cancelPlanButton(BuildContext context) {
    return _customButton(
      context: context,
      title: 'Cancel Plan',
      onPressed: () {
        openAlertDialog(
          context: context,
          onCancel: () {
            viewModel.cancelSubscription();
            Navigator.of(context).pop();
          },
          onConfirm: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  Widget _availablePoints(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_10.w, vertical: Dimens.dimen_16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_10.r),
        color: const Color(0xFFF0EFF9),
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
                      fontSize: Dimens.dimen_14.sp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Text(
                '${viewModel.userSubscription.value?.point ?? 0}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.dimen_24.sp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void openAlertDialog({
    required BuildContext context,
    required VoidCallback onCancel,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: CancelSubDialogue(onCancel: onCancel, onConfirm: onConfirm),
        );
      },
    );
  }

  Color getColor(String subscriptionType) {
    switch (subscriptionType.toLowerCase()) {
      case 'gold':
        return Color(0xFFFFA800);
      case 'standard':
        return Color(0xFF00A1CA);
      case 'platinum':
        return Color(0xFFC2C2C2);
      default:
        return Color(0xFF00A1CA);
    }
  }
}
