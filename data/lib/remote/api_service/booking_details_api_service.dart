import 'dart:io';

import 'package:data/remote/response/booking/booking_detail_response.dart';
import 'package:data/remote/response/booking/user_bookings_response.dart';

abstract class BookingDetailsApiService {
  Future<List<UserBookingsResponse>> getBookings();

  Future<BookingDetailsResponse> getBookingById({required String bookingId});

  Future<bool> cancelBooking(
      {required String bookingId,
      required String reason,
      required String comment,
      required List<File> files
      });

  Future<String> makePayment({required String bookingId});

}
