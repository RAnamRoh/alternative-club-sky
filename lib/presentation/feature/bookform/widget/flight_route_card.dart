import 'dart:math';

import 'package:domain/model/skyClubModels/searched_flight_domain.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/bookform/bookform_view_model.dart';
import 'package:club_alt/presentation/util/custom_date_formater.dart';
import 'package:club_alt/presentation/values/dimens.dart';

import '../../../common/skyClubWidgets/line_painter.dart';

class FlightRouteCard extends StatelessWidget {

  final JourneyDomain journey;

  const FlightRouteCard({super.key, required this.journey,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.dimen_10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildDepartureInfo(context),
        Divider(),
        _flightPath(context, journey.segments),
      ],
    );
  }

  Widget _buildDepartureInfo(BuildContext context) {


    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20),
      child: Row(
        children: [
          Transform.rotate(
              angle: pi/2,
            child: Icon(
              Icons.airplanemode_on,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(width: Dimens.dimen_10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Departing ${CustomDateFormater.getDayMonthYearDDMMMYYYY(journey.departureTime)}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                '${SearchedFlightDomain.getFlightDuration(SearchedFlightDomain.getTotalFlightDurationInMinutes(journey.segments))}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCodeInfo(
      {required BuildContext context,
      bool isFilled = false,
      bool haveTopLine = false,
      bool isTopDash = false,
      bool isBottomDash = false,
      bool haveBottomLine = false,
      required String code}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomPaint(
            painter: LinePainter(
              color: haveTopLine
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              isDashed: isTopDash,
            ),
          ),
        ),
        // Center the circular container
        Container(
          padding: EdgeInsets.all(Dimens.dimen_8),
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                isFilled ? Theme.of(context).colorScheme.primary : Colors.white,
            border: Border.all(
                color: Theme.of(context).colorScheme.primary, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 3),
              ),
            ]
          ),
          child: Center(
            child: Text(
              code,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isFilled
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ),
        // Line taking remaining bottom space
        Expanded(
          child: CustomPaint(
            painter: LinePainter(
              color: haveBottomLine
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              isDashed: isBottomDash,
            ),
          ),
        ),
      ],
    );
  }


  Widget _flightPath(BuildContext context, List<SegmentDomain> segments) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20),
      child: Column(
        children: [
          // Origin
          _originDestinationInfo(context, segments.first),

          // Layovers - Show each segment's destination as a layover (except the last one)
          for (int i = 0; i < segments.length; i++)...{
            if (i < segments.length - 1)...{
              _layoverDestinationInfo(
                context: context,
                code: segments[i].destinationCode,
                isTopDash: true, // Keep dashed line formatting
                time: segments[i].arrivalTime// Pass the segment to show different departure times
              ),
            } else ...{
             segments.first.originCode == segments[i].originCode ? SizedBox.shrink() : _layoverDestinationInfo(
                context: context,
                code: segments[i].originCode,
                isTopDash: true, // Keep dashed line formatting
                time: segments[i].departureTime
                // Pass the segment to show different departure times
              ),
            }

          },


          // Destination
          _arrivalDestinationInfo(context, segments.last),
        ],
      ),
    );
  }



  Widget _originDestinationInfo(BuildContext context, SegmentDomain segment) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_10),
        border: Border.all(color: Color(0xFFEFEFEF), width: 1),
        color: Color(0xFFF6F6F6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: _buildLogoAndInfo(context, segment)),
          Expanded(
              child: _buildCodeInfo(
                  context: context,
                  isFilled: true,
                  code: segment.originCode,
                  haveBottomLine: true)),
          Expanded(
              child: _buildTimeInfo(context, segment.departureTime)),
        ],
      ),
    );
  }

  Widget _arrivalDestinationInfo(BuildContext context, SegmentDomain segment) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_10),
        border: Border.all(color: Color(0xFFEFEFEF), width: 1),
        color: Color(0xFFF6F6F6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: _buildLogoAndInfo(context, segment)),
          Expanded(
            child: _buildCodeInfo(
              context: context,
              isFilled: true,
              code: segment.destinationCode,
              haveTopLine: true,
            ),
          ),
          Expanded(
              child: _buildTimeInfo(context,segment.arrivalTime)),
        ],
      ),
    );
  }

  Widget _layoverDestinationInfo({
    required BuildContext context,
    required String code,
    required DateTime time,
    bool isTopDash = false,
  }) {
    return Container(
      height: 120,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container()), // Empty space for alignment
          Expanded(
            child: _buildCodeInfo(
              context: context,
              isFilled: false,
              code: code,
              haveTopLine: true,
              haveBottomLine: true,
              isBottomDash: true,
              isTopDash: isTopDash,
            ),
          ),
          Expanded(
            child: _buildTimeInfo(context, time), // Show departure time for each layover
          ),
        ],
      ),
    );
  }



  Widget _buildLogoAndInfo(BuildContext context, SegmentDomain segment) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Dimens.dimen_10),
        bottomLeft: Radius.circular(Dimens.dimen_10),
      ),
      child: Container(
        padding: EdgeInsets.all(Dimens.dimen_8),
        color: Colors.white,
        child: Column(
          children: [
            Image.network(segment.aircraftLogoUrl, height: 40),
            Text(
              '${segment.airline.code} - ${segment.airline.flightNumber}',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              segment.seatClass.name,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: Dimens.dimen_12,
              ),
            ),
            Text(
              '${segment.baggageQuantityAllowance}kg',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: Dimens.dimen_12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeInfo(BuildContext context, DateTime time) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              CustomDateFormater.getFormattedTimeInAmPm(time),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w500,

              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(CustomDateFormater.getFormattedDayDateMonth(time),
                style: Theme.of(context).textTheme.titleSmall,
            ),
          ),

        ],
      ),
    );
  }


}
