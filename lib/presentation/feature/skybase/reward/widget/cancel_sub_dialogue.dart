import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:club_alt/presentation/base/screen_util/screen_util_builder.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';

import '../../../../values/dimens.dart';

class CancelSubDialogue extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const CancelSubDialogue(
      {super.key, required this.onCancel, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return _buildBox(context);
  }

  Widget _buildLogo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_15.r),
      width: Dimens.dimen_80.w,
      height: Dimens.dimen_80.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: Color(0xFF00A1CA),
            width: Dimens.dimen_3,
          )),
      child: AssetImageView(
        fileName: 'club_alt_symbol.svg',
        height: Dimens.dimen_20.h,
        width: Dimens.dimen_20.w,
      ),
    );
  }

  Widget _buildBox(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 335.w,
          padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20.r, vertical: Dimens.dimen_20.r).copyWith(
            top: Dimens.dimen_40.r,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimens.dimen_16.r),
            border: Border.all(
              color: Color(0xFF00A1CA),
              width: Dimens.dimen_3.w,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: Dimens.dimen_10.h),
              _buildHeader(context),
              SizedBox(height: Dimens.dimen_10.h),
              _buildPerkList(context),
              SizedBox(height: Dimens.dimen_10.h),
              _buildFooter(context),
            ],
          ),
        ),
        Positioned(
          top: -Dimens.dimen_40.h,
          child: _buildLogo(context),
        ),
      ],
    );

  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text('Wait, Don\'t Miss Out on Exclusive Travel Perks!',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: Dimens.dimen_20.sp,
                )),
        Text(
          'Are you sure you want to cancel your subscription? By staying with us you will continue to enjoy: ',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: Dimens.dimen_16.sp,
              ),
        ),
      ],
    );
  }

  Widget _buildPerkList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimens.dimen_10,
      ),
      child: Column(
        children: [
          _buildPerk(context, 'Priority access to exclusive flight deals'),
          _buildPerk(context, 'Discounts on premium lounges and services'),
          _buildPerk(context,
              'Personalized travel recommendations tailored to your preferences'),
          _buildPerk(context, 'Hassle-free booking and 24/7 customer support'),
        ],
      ),
    );
  }

  Widget _buildPerk(BuildContext context, String perk) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimen_2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimens.dimen_20.h,
            width: Dimens.dimen_1.w,
            child: Icon(
              Icons.circle,
              color: Colors.black,
              size: Dimens.dimen_5.r,
            ),
          ),
          SizedBox(
            width: Dimens.dimen_10.w,
          ),
          Flexible(
            child: Text(
              textAlign: TextAlign.start,
              perk,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.dimen_16.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildButton(context,
            onPressed: onCancel, title: 'Cancel Anyway', isPrimary: false),
        _buildButton(context,
            onPressed: onConfirm,
            title: 'Keep My Subscription',
            isPrimary: true),
      ],
    );
  }

  Widget _buildButton(BuildContext context,
      {required VoidCallback onPressed,
      required String title,
      required bool isPrimary}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimen_5.r),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isPrimary ? Theme.of(context).colorScheme.primary : Colors.grey,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dimen_8.r),
          ),
          minimumSize: Size(double.infinity, Dimens.dimen_50.h),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: Dimens.dimen_18.sp,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
