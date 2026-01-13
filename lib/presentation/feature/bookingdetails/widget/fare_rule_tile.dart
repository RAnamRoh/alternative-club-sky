import 'package:domain/model/skyClubModels/fare_rules_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_club/presentation/common/clipper/booingDetailsBody_clipper.dart';
import 'package:sky_club/presentation/common/clipper/bookingDetailHeader_clipper.dart';
import 'package:sky_club/presentation/util/date_to_string.dart';
import 'package:sky_club/presentation/values/dimens.dart';



class FareRuleTile extends StatelessWidget {
  final FareRulesModel rule;

  const FareRuleTile({super.key, required this.rule});

  @override
  Widget build(BuildContext context) {
    return _buildCard(context);
  }

  Widget _buildCard(BuildContext context) {
    return
        //   ClipPath(
        //   clipper: FareClipper(),
        //   child: Container(
        //     width: 335,
        //     margin: EdgeInsets.symmetric(vertical: Dimens.dimen_10),
        //     child: Column(
        //       children: [
        //         _buildHeader(context),
        //         _buildFareAndValidity(context),
        //         _buildDetails(context),
        //       ],
        //     ),
        //   ),
        // );
        Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.dimen_10.h),
      child: Column(
        children: [
          ClipPath(
            clipper: BookingDetailHeaderClipper(),
            child: Column(
              children: [
                _buildHeader(context),
                _buildFareAndValidity(context),
              ],
            ),
          ),
          ClipPath(
            clipper: BookingDetailBodyClipper(),
            child: _buildDetails(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_20.w, vertical: Dimens.dimen_12.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.dimen_10.r),
          topRight: Radius.circular(Dimens.dimen_10.r),
        ),
      ),
      child: Row(
        children: [
          Text(
            'TRIP SEGMENT',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const Spacer(),
          Text(
            rule.tripSegment,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildFareAndValidity(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_20, vertical: Dimens.dimen_10),
      color: const Color(0xFFE9E6FF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FARE VALIDITY',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(
            height: Dimens.dimen_5,
          ),
          // ListView.builder(
          //     itemCount: rule.refundPenalties.length,
          //     physics: NeverScrollableScrollPhysics(),
          //     itemBuilder: (context, index) {
          //       return Column(
          //         children: [
          //           Text(
          //             'Not Valid Before ${DateToString.dateToDayMonthYearCompact(rule.refundPenalties[index].applicableFromDate)}',
          //             style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.w400,
          //                   fontSize: Dimens.dimen_13,
          //                 ),
          //           ),
          //           Text(
          //             'Not Valid After ${DateToString.dateToDayMonthYearCompact(rule.refundPenalties[index].applicableToDate)}',
          //             style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.w400,
          //                   fontSize: Dimens.dimen_13,
          //                 ),
          //           ),
          //         ],
          //       );
          //     }),

          ...rule.refundPenalties.map((pen) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Not Valid Before ${DateToString.dateToDayMonthYearCompact(pen.applicableFromDate)}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: Dimens.dimen_13,
                      ),
                ),
                Text(
                  'Not Valid After ${DateToString.dateToDayMonthYearCompact(pen.applicableToDate)}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: Dimens.dimen_13,
                      ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_20, vertical: Dimens.dimen_20),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildChangeFee(context),
          SizedBox(
            height: Dimens.dimen_10,
          ),
          _buildRefundFee(context),
        ],
      ),
    );
  }

  Widget _buildChangeFee(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CHANGE FEES',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: Dimens.dimen_5,
        ),
        // ListView.builder(
        //     itemCount: rule.exchangePenaltyList.length,
        //     physics: NeverScrollableScrollPhysics(),
        //     itemBuilder: (context, index) {
        //       return _buildBulletPoint(context, '${rule.exchangePenaltyList[index].applicability} ${rule.exchangePenaltyList[index].penalty.currency}${rule.exchangePenaltyList[index].penalty.amount}');
        //     }),
        ...rule.exchangePenaltyList.map((pen) {
          return _buildBulletPoint(context,
              '${pen.applicability} ${pen.penalty.currency}${pen.penalty.amount}');
        }),
      ],
    );
  }

  Widget _buildRefundFee(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'REFUND FEES',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: Dimens.dimen_5,
        ),
        // ListView.builder(
        //     itemCount: rule.refundPenalties.length,
        //     physics: NeverScrollableScrollPhysics(),
        //     itemBuilder: (context, index) {
        //       return Text('${rule.refundPenalties[index].applicability} ${rule.refundPenalties[index].penalty.currency} ${rule.refundPenalties[index].penalty.amount}');
        //     }),
        ...rule.refundPenalties.map((pen) {
          return _buildBulletPoint(context,
              '${pen.applicability} ${pen.penalty.currency} ${pen.penalty.amount}');
        }),
      ],
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
          child: Icon(Icons.circle, size: 4),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.dimen_14,
                  color: const Color(0xFF4F4F4F),
                ),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
