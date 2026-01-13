import 'package:domain/model/skyClubModels/fare_rules_model.dart';
import 'package:domain/model/skyClubModels/travel_itinerary_model.dart';
import 'package:flutter/material.dart';

import 'package:sky_club/presentation/common/clipper/booingDetailsBody_clipper.dart';
import 'package:sky_club/presentation/common/clipper/bookingDetailHeader_clipper.dart';

import '../../../util/date_to_string.dart';
import '../../../values/dimens.dart';

class TravelItineraryTile extends StatelessWidget {

  final TravelItineraryModel model;
  final FareRulesModel fareRule;

  const TravelItineraryTile({super.key, required this.model, required this.fareRule});

  @override
  Widget build(BuildContext context) {
    return _buildCard(context);
  }

  Widget _buildCard(BuildContext context) {
    return
    //   ClipPath(
    //     //   clipper: BagAndOtherClipper(),
    //     //   child: Container(
    //     //     width: 335,
    //     //     margin: EdgeInsets.symmetric(vertical: Dimens.dimen_10),
    //     //     child: Column(
    //     //       children: [
    //     //         _buildHeader(context),
    //     //         _buildFareAndValidity(context),
    //     //         _buildDetails(context),
    //     //       ],
    //     //     ),
    //     //   ),
    //     // );
    Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.dimen_10),
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
          horizontal: Dimens.dimen_20, vertical: Dimens.dimen_12),
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .colorScheme
            .primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.dimen_10),
          topRight: Radius.circular(Dimens.dimen_10),
        ),
      ),
      child: Row(
        children: [
          Text(
            'FLIGHT',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Text(
            model.flightNumber,
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
      color: Color(0xFFE9E6FF),
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
          SizedBox(height: Dimens.dimen_5,),
          ...fareRule.refundPenalties.map((pen) {
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
      color: Colors.white,
      child: Column(
        children: [
          _buildInfoRow(context, 'Check-in', model.checkIn, false),
          _buildInfoRow(context, 'From', model.from, false),
          _buildInfoRow(context, 'To', model.to, false),
          _buildInfoRow(context, 'Departure', DateToString.dayMonthYearTime(model.departureDate), false),
          _buildInfoRow(context, 'Arrival', DateToString.dayMonthYearTime(model.arrivalDate), false),
          _buildInfoRow(context, 'Terminal', model.terminal, false),
          _buildInfoRow(context, 'Cabin', model.cabin, false),
          _buildInfoRow(context, 'Status', model.status, false),
          _buildInfoRow(context, 'Fleet Info', model.fleetInfo, false),
        ],
      ),
    );
  }

  Widget _buildNameRow(BuildContext context, String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }

  Widget _buildInfoRow(
      BuildContext context, String title, String value, bool isBold) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Color(0xFF4F4F4F),
            ),
          ),
          Spacer(),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isBold ? Colors.black : Color(0xFF4F4F4F),
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
            ),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }



}
