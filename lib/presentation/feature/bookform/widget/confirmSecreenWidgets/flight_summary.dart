import 'package:domain/enum/seat_class.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/util/custom_date_formater.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class FlightSummary extends StatelessWidget {
  final SearchedFlightDomain ticket;


  const FlightSummary({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...ticket.journeys.map((journey) => _buildJourney(
            context: context,
            journey: journey,
          )),
        ],
      ),
    );
  }











  Widget _flightDirection(BuildContext context, {required String direction}) {
    return Container(
      width: double.infinity,
      color: Colors.tealAccent,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dimens.dimen_10),
        child: Center(
          child: Text(direction.toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: <Color>[
                      Color(0xFF00A1CA),
                      Color(0xFF281DC5),
                    ],
                  ).createShader(
                    const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0),
                  ),
              )),
        ),
      ),
    );
  }



  Widget _buildJourney(
      {required BuildContext context, required JourneyDomain journey}) {
    return Column(
      children: [
        _flightDirection(context, direction: journey.journeyDirection.name),
        _buildJourneySegment(context: context, segments: journey.segments),
      ],
    );
  }

  Widget _buildSegment(
      {required BuildContext context, required SegmentDomain segment}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildOriginAndDestination(context, segment: segment),
        SizedBox(height: Dimens.dimen_12,),
        _buildExtraInfo(context: context, segment: segment),
      ],
    );
  }

  Widget _airportAndTime(
      {required BuildContext context,
        required DateTime dateTime,
        required String label,
        required IconData icon}) {
    return Column(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: Dimens.dimen_20.r,
        ),
        Text(label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: Dimens.dimen_12.sp,
              fontWeight: FontWeight.w500,
            )),
        Text(
          CustomDateFormater.getFormattedTimeDayDate(dateTime),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: Dimens.dimen_10.sp,
          ),
        ),
        Text(
          CustomDateFormater.getFormattedYear(dateTime),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: Dimens.dimen_10.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildOriginAndDestination(BuildContext context,
      {required SegmentDomain segment}) {
    return Row(
      children: [
        _airportAndTime(
            context: context,
            dateTime: segment.departureTime,
            label: segment.originCode,
            icon: Icons.airplanemode_on),
        const Spacer(),
        Column(
            children: [
              const AssetImageView(fileName: 'left_direction_arrow.svg'),
              SizedBox(height: Dimens.dimen_15),
              Text(SearchedFlightDomain.getFlightDuration(segment.flightDuration),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: Dimens.dimen_10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
        const Spacer(),
        _airportAndTime(
            context: context,
            dateTime: segment.arrivalTime,
            label: segment.destinationCode,
            icon: Icons.pin_drop),
      ],
    );
  }

  Widget _buildExtraInfoElement(
      {required BuildContext context,
        required String label,
        required Widget image}) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_5.r),
        color: const Color(0xFFF3F3F3),
      ),
      child: Row(
        children: [
          image,
          const SizedBox(
            width: 5,
          ),
          Text(label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: Dimens.dimen_12,
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    );
  }

  Widget _buildExtraInfo(
      {required BuildContext context, required SegmentDomain segment}) {
    return Container(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildExtraInfoElement(
                context: context,
                label: segment.airline.name,
                image: Image.network(
                  segment.aircraftLogoUrl,
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.airplanemode_inactive,
                      size: 30,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              SizedBox(width: Dimens.dimen_15,),
              _buildExtraInfoElement(
                context: context,
                label: segment.aircraftName,
                image: const Icon(Icons.airplanemode_on),
              ),
              SizedBox(width: Dimens.dimen_15,),
              _buildExtraInfoElement(
                context: context,
                label: segment.seatClass.seatName,
                image: const Icon(Icons.screen_lock_landscape),
              ),
              SizedBox(width: Dimens.dimen_15,),
              _buildExtraInfoElement(
                context: context,
                label: '${segment.baggageQuantityAllowance} of checked baggage',
                image: const Icon(Icons.luggage),
              )
            ],
          )
      ),
    );
  }


  Widget _buildJourneySegment({required BuildContext context, required List<SegmentDomain> segments}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < segments.length; i++) ...[
            _buildSegment(context: context, segment: segments[i]),
            if (i < segments.length - 1)
              _buildLayoverWidget(context, segments[i], segments[i + 1]),
          ],
        ],
      ),
    );
  }


  Widget _buildLayoverWidget(BuildContext context,  first, SegmentDomain second) {
    final layoverDuration = second.departureTime.difference(first.arrivalTime);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Dimens.dimen_8),
      margin: EdgeInsets.symmetric(vertical: Dimens.dimen_12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: Color(0xFFF0EFF9),
      ),
      child: Center(
        child: Text('Layover ${_formatDuration(layoverDuration)}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    return "${hours}h ${minutes}m";
  }




}
