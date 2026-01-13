import 'package:domain/model/skyClubModels/airline.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';

class FlightResponseDomain {
  final List<SearchedFlightDomain> ticketList;
  final List<AirlineDomain> airportList;


  FlightResponseDomain({required this.ticketList, required this.airportList});
}