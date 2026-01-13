import 'dart:io';

import 'package:data/remote/api_client/api_client.dart';
import 'package:data/remote/api_service/booking_details_api_service.dart';
import 'package:data/remote/response/booking/booking_detail_response.dart';
import 'package:data/remote/response/booking/user_bookings_response.dart';
import 'package:data/sessionManager/user_session_manager.dart';
import 'package:domain/exceptions/authentication_exception.dart';
import 'package:domain/exceptions/basic_exception.dart';
import 'package:domain/exceptions/network_exceptions.dart';
import 'package:domain/exceptions/payment_exception.dart';
import 'package:domain/exceptions/session_exception.dart';

class BookingDetailsApiServiceImpl implements BookingDetailsApiService {

  ApiClient apiClient;

  BookingDetailsApiServiceImpl({required this.apiClient});

  @override
  Future<List<UserBookingsResponse>> getBookings() async {

    try {

      final response = await apiClient.get('booking/me');


      final items = response['items'] as List<dynamic>;

      final bookings = items.map((json){
        return UserBookingsResponse.fromJson(json);
      }).toList();

      return bookings;

    } on NetworkException catch(e) {
      throw BasicException(e.message);
    } on SessionException catch(e){
      throw SessionException(e.message);
    }

  }

  @override
  Future<BookingDetailsResponse> getBookingById({required String bookingId}) async {
    try {

      final response = await apiClient.get('booking/getbooking/$bookingId');

      final booking = BookingDetailsResponse.fromJson(response);

      return booking;

    } on NetworkException catch(e) {
      throw BasicException(e.message);
    } on SessionException catch(e){
      rethrow;
    }
  }

  @override
  Future<bool> cancelBooking({
    required String bookingId,
    required String reason,
    required String comment,
    required List<File> files
  }) async {

    try {

      final response = await apiClient.uploadCancellationRequest('booking/cancel', bookingId, reason, comment, files);

      return response['success'];

    } on NetworkException catch(e) {
      throw BasicException(e.message);
    } on SessionException catch(e){
      rethrow;
    }

  }

  @override
  Future<String> makePayment({required String bookingId}) async{
    try {
      final response = await apiClient.post('payment/create/$bookingId');

      final String url = response['message'];

      return url;

    } on NetworkException catch (e) {
      throw PaymentException(e.message);
    }
  }

}
