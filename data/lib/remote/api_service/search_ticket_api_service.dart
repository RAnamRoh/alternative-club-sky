
import 'package:data/remote/request/search_flight_ticket_request.dart';
import 'package:data/remote/response/ticket/flight_response.dart';

abstract class SearchTicketApiService {


  Future<FlightResponse> searchTicket({required SearchFlightTicketRequest request});


}