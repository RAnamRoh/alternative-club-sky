import 'package:domain/enum/seat_class.dart';
import 'package:domain/model/skyClubModels/search_flight_ticket.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/common/widget/asset_image_view.dart';
import 'package:sky_club/presentation/feature/searchticket/searchticket_view_model.dart';
import 'package:sky_club/presentation/util/custom_date_formater.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class TicketDetails extends StatelessWidget {
  final SearchedFlightDomain ticket;
  final SearchticketViewModel viewModel;

  const TicketDetails(
      {super.key, required this.ticket, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.only(
          bottom: Dimens.dimen_16,
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _bookNow(context),
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
                      ..shader = LinearGradient(
                        colors: <Color>[
                          Color(0xFF00A1CA),
                          Color(0xFF281DC5),
                        ],
                      ).createShader(
                        Rect.fromLTWH(0.0, 0.0, 300.0, 70.0),
                      ),
                  )),
        ),
      ),
    );
  }

  Widget _bookNow(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFFF0EFF9),
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AUD \$${ticket.totalPrice}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          )),
                  Text(
                    'Total (Includes taxes)',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: Dimens.dimen_11,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  viewModel.bookNowClicked(selectedFlight: ticket);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.white,
                  minimumSize: Size(125, 36),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.dimen_5),
                  ),
                  shadowColor: Colors.black,
                  elevation: 3.0,
                ),
                child: Text(
                  "Book Now",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildJourney(
      {required BuildContext context, required JourneyDomain journey}) {
    return Container(

      child: Column(
        children: [
          _flightDirection(context, direction: journey.journeyDirection.name),
          _buildJourneySegment(context: context, segments: journey.segments),
        ],
      ),
    );
  }

  Widget _buildSegment(
      {required BuildContext context, required SegmentDomain segment}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildOriginAndDestination(context, segment: segment),
          SizedBox(height: Dimens.dimen_12,),
          _buildExtraInfo(context: context, segment: segment),
        ],
      ),
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
          size: 20,
        ),
        Text(label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: Dimens.dimen_12,
                  fontWeight: FontWeight.w500,
                )),
        Text(
          CustomDateFormater.getFormattedTimeDayDate(dateTime),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: Dimens.dimen_10,
              ),
        ),
        Text(
          CustomDateFormater.getFormattedYear(dateTime),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: Dimens.dimen_10,
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
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFFF3F3F3),
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
              image: Icon(Icons.airplanemode_on),
            ),
            SizedBox(width: Dimens.dimen_15,),
            _buildExtraInfoElement(
              context: context,
              label: segment.seatClass.seatName,
              image: Icon(Icons.screen_lock_landscape),
            ),
            SizedBox(width: Dimens.dimen_15,),
            _buildExtraInfoElement(
              context: context,
              label: '${segment.baggageQuantityAllowance} of checked baggage',
              image: Icon(Icons.luggage),
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
