import 'dart:io';

import 'package:domain/model/skyClubModels/baggage_fare_model.dart';
import 'package:domain/model/skyClubModels/booking.dart';
import 'package:domain/model/skyClubModels/booking_detail_content.dart';
import 'package:domain/model/skyClubModels/booking_list_and_stats.dart';
import 'package:domain/model/skyClubModels/booking_stats.dart';
import 'package:domain/model/skyClubModels/fare_rules_model.dart';
import 'package:domain/model/skyClubModels/passenger_info_model.dart';
import '../model/skyClubModels/travel_itinerary_model.dart';

abstract class BookingDetailsRepository {


  Future<BookingDetailContent> getBookingById({required String bookingId});


  Future<BookingListAndStats> getMyBookings();

  Future<bool> cancelBooking({required String bookingId, required String reason, required String comment, required List<File> files});


  Future<String> makePayment({required String bookingId});


}