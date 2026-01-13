
import 'package:data/remote/api_client/api_client.dart';
import 'package:data/remote/api_service/search_ticket_api_service.dart';
import 'package:data/remote/request/search_flight_ticket_request.dart';
import 'package:data/remote/response/ticket/flight_response.dart';

class SearchTicketApiServiceImpl implements SearchTicketApiService{

  ApiClient apiClient;

  SearchTicketApiServiceImpl({required this.apiClient});

  @override
  Future<FlightResponse> searchTicket({required SearchFlightTicketRequest request}) async {
    
    final response = await apiClient.post('flight',data: request.toJson());


    return FlightResponse.fromJson(response);

  }





}