

import 'package:data/mapper/skyClub/search_ticket_mapper.dart';
import 'package:data/remote/api_service/search_ticket_api_service.dart';
import 'package:data/remote/response/ticket/flight_response.dart';
import 'package:domain/model/skyClubModels/airline.dart';
import 'package:domain/model/skyClubModels/flight_response_domain.dart';
import 'package:domain/model/skyClubModels/search_flight_details.dart';
import 'package:domain/model/skyClubModels/search_flight_ticket.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';
import 'package:domain/repository/search_ticket_repository.dart';

class SearchTicketRepositoryImpl implements SearchTicketRepository {


  final SearchTicketApiService apiService;

  SearchTicketRepositoryImpl({required this.apiService});






  @override
  Future<FlightResponseDomain> fetchTicketList({required SearchFlightDetails searchFlightDetails}) async {

    final FlightResponse response = await apiService.searchTicket(request: searchFlightDetails.toSearchFlightTicketRequest());

    final List<SearchedFlightDomain> flights = SearchTicketMapper.fromFlightResponseList(response);
    final List<AirlineDomain> airlines = SearchTicketMapper.fromAirlineResponseList(response.airlines);

    final FlightResponseDomain flightResponseDomain = FlightResponseDomain(ticketList: flights, airportList: airlines);

    return flightResponseDomain;
  }





}