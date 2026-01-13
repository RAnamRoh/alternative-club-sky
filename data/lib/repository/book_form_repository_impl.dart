
import 'package:data/remote/api_service/book_form_api_service.dart';
import 'package:data/remote/request/ticket_booking_request.dart';
import 'package:data/remote/response/booking/sms_fee_response.dart';
import 'package:domain/model/skyClubModels/booking_contact_details.dart';
import 'package:domain/model/skyClubModels/passenger.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';
import 'package:domain/repository/book_form_repository.dart';

class BookFormRepositoryImpl implements BookFormRepository{

  final BookFormApiService apiService;

  BookFormRepositoryImpl({required this.apiService});



  @override
  Future<String> bookTicket({
    required List<PassengerDomain> passengerList,
    required SearchedFlightDomain searchedFlight,
    required BookingContactDetails bookingDetails,
   required bool hasSMS,
  }) async {


    final TicketBookingRequest bookingRequest =
    TicketBookingRequest.createTicketBookingRequest(
        passengerList: passengerList,
        bookingDetails: bookingDetails,
        searchedFlight: searchedFlight,
      hasSMS: hasSMS
    );

    final response = await apiService.bookFlight(bookingDetails: bookingRequest);

    return response.bookingId;

  }

  @override
  Future<String> makePayment({required String bookingId}) async {
      final String response = await apiService.makePayment(bookingId: bookingId);
      return response;
  }

  @override
  Future<SmsFeeResponse> getSmsFee() async {
    final SmsFeeResponse response = await apiService.getSmsFee();
    return response;
  }

}