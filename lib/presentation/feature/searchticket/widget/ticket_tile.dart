import 'dart:math';

import 'package:domain/model/skyClubModels/search_flight_ticket.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/feature/searchticket/searchticket_view_model.dart';
import 'package:club_alt/presentation/feature/searchticket/widget/ticket_details.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class TicketTile extends StatelessWidget {
  final SearchedFlightDomain ticket;
  final SearchticketViewModel viewModel;

  const TicketTile({super.key, required this.ticket, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return _ticketFace(context);
  }

  Widget _ticketFace(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.dimen_10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         // _tripInfo(
         //     context: context,
         //     departureTime: ticket.departureTime,
         //     arrivalTime: ticket.journeys.first.arrivalTime,
         //     originCode: ticket.originCode,
         //     destinationCode: ticket.destinationCode,
         //     stop: ticket.stops.toString(),
         //   isRoundTrip: false
         // ),
         //
         //  const SizedBox(
         //    height: 15,
         //  ),
         //  ticket.isRoundTrip ?
         //  _tripInfo(context: context, departureTime: ticket.journeys.last.departureTime, arrivalTime: ticket.journeys.last.arrivalTime, originCode: ticket.destinationCode, destinationCode: ticket.originCode, stop: (ticket.journeys.first.segments.length - 1).toString(), isRoundTrip: true)
         //  :
         //  SizedBox.shrink(),
          Column(
            children: [
              ...ticket.journeys.map((journey) => _tripInfo(
                  context: context,
                  departureTime: journey.departureTime,
                  arrivalTime: journey.arrivalTime,
                  originCode: journey.originCode,
                  destinationCode: journey.destinationCode,
                  stop: journey.stops.toString(),
                  logo: journey.aircraftLogoUrl,
              )).toList(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimens.dimen_10),
              bottomRight: Radius.circular(Dimens.dimen_10),
            ),
            child: Container(
              width: double.infinity,
              color: Color(0xFF110A7A),
              child: ExpansionTile(
                title: Row(
                  children: [
                    Text(
                      'AUD \$${ticket.pricePerPerson}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: Dimens.dimen_15,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('Per person',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onPrimary,
                            )),
                  ],
                ),
                children: [
                  TicketDetails(
                    ticket: ticket, viewModel: viewModel,
                  ),
                ],
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _dateTimeAirline(BuildContext context, DateTime departureTime, DateTime arrivalTime, String logo) {
    return Row(
      children: [
        _buildDate(context, true, ticket.getFormattedTime(departureTime),
            ticket.getFormattedDate(departureTime)),
        Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            logo,
            height: 50,
            width: 50,
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
        Spacer(),
        _buildDate(context, false, ticket.getFormattedTime(arrivalTime),
            ticket.getFormattedDate(arrivalTime)),
      ],
    );
  }

  Widget _departureAndDestination(BuildContext context, String originCode, String destinationCode, String stop, DateTime departureTime, DateTime arrivalTime) {
    return Row(
      children: [
        _airportCode(
            code: originCode,
            icon: Icons.airplanemode_active,
            context: context),
        Spacer(),
        _buildFlightStopAndTime(
            context: context, stop: (ticket.journeys.first.segments.length - 1).toString(), time: SearchedFlightDomain.getFlightDuration(SearchedFlightDomain.getTotalFlightDurationInMinutes(ticket.journeys.first.segments))),
        Spacer(),
        _airportCode(
            code: destinationCode,
            icon: Icons.pin_drop,
            context: context),
      ],
    );
  }

  Widget _airportCode(
      {required BuildContext context,
      required String code,
      required IconData icon}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(Dimens.dimen_10),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: Dimens.dimen_20,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            height: Dimens.dimen_10,
          ),
          Text(
            code,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildDate(
      BuildContext context, bool isDeparture, String time, String date) {
    return Column(
      crossAxisAlignment:
          isDeparture ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          time,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        Text(
          date,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: Dimens.dimen_11,
              ),
        ),
      ],
    );
  }

  Widget _buildFlightStopAndTime(
      {required BuildContext context,
      required String stop,
      required String time}) {
    return Column(
      children: [
        AssetImageView(fileName: 'flightWay.svg'),
        Text(
          '${time}, ${stop} stop',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: Dimens.dimen_12,
              ),
        ),
      ],
    );
  }

  Widget _tripInfo({required BuildContext context, required DateTime departureTime, required DateTime arrivalTime ,required String originCode, required String destinationCode, required String stop, required String logo}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          _dateTimeAirline(context, departureTime, arrivalTime, logo),
          SizedBox(
            height: Dimens.dimen_10,
          ),
          _departureAndDestination(context, originCode, destinationCode, stop, departureTime, arrivalTime),
        ],
      ),
    );
  }

}
