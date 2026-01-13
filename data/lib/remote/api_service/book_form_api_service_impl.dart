import 'package:data/remote/api_client/api_client.dart';
import 'package:data/remote/api_service/book_form_api_service.dart';
import 'package:data/remote/request/ticket_booking_request.dart';
import 'package:data/remote/response/booking/sms_fee_response.dart';
import 'package:data/remote/response/ticket/ticket_booking_response.dart';
import 'package:domain/exceptions/authentication_exception.dart';
import 'package:domain/exceptions/base_exception.dart';
import 'package:domain/exceptions/network_exceptions.dart';

class BookFormApiServiceImpl implements BookFormApiService {
  final ApiClient apiClient;

  BookFormApiServiceImpl({required this.apiClient});

  @override
  Future<TicketBookingResponse> bookFlight({
    required TicketBookingRequest bookingDetails,
  }) async {
    try {
      // Make the POST request to the 'flight' endpoint
      final response = await apiClient.post(
        'booking/create',
        data: bookingDetails.toJson(),
      );

      // Parse the response into a TicketBookingResponse object
      return TicketBookingResponse.fromJson(response);
    } on NetworkException catch (e) {
      throw AuthenticationException(e.message);
    }
  }

  @override
  Future<String> makePayment({required String bookingId}) async {
    try {
      final response = await apiClient.post('payment/create/$bookingId');

      final String url = response['message'];

      return url;

    } on NetworkException catch (e) {
      throw AuthenticationException(e.message);
    }
  }

  @override
  Future<SmsFeeResponse> getSmsFee() async {
    try {
      final response = await apiClient.get('common/lookup/SMS_FEE');

      final SmsFeeResponse smsFeeResponse = SmsFeeResponse.fromJson(response);

      return smsFeeResponse;

    } on NetworkException catch (e) {
      throw AuthenticationException(e.message);
    }
  }
}