import 'package:data/remote/request/ticket_booking_request.dart';
import 'package:data/remote/response/booking/sms_fee_response.dart';
import 'package:data/remote/response/ticket/ticket_booking_response.dart';

abstract class BookFormApiService {
  Future<TicketBookingResponse> bookFlight({required TicketBookingRequest bookingDetails});
  Future<String> makePayment({required String bookingId});
  Future<SmsFeeResponse> getSmsFee();
}