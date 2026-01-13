


import 'package:domain/model/skyClubModels/airline.dart';
import 'package:domain/model/skyClubModels/flight_response_domain.dart';
import 'package:domain/model/skyClubModels/search_flight_details.dart';
import 'package:domain/model/skyClubModels/search_flight_ticket.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';

abstract class SearchTicketRepository {
  Future<FlightResponseDomain> fetchTicketList({required SearchFlightDetails searchFlightDetails});
}