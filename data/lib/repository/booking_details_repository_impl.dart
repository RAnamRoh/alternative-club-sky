import 'dart:io';

import 'package:data/mapper/skyClub/bk_baggage_and_fare_mapper.dart';
import 'package:data/mapper/skyClub/bk_fare_rules_mapper.dart';
import 'package:data/mapper/skyClub/bk_passenger_info_mapper.dart';
import 'package:data/mapper/skyClub/bk_travel_itinerary_mapper.dart';
import 'package:data/mapper/skyClub/booking_mapper.dart';
import 'package:data/remote/api_service/booking_details_api_service.dart';
import 'package:data/remote/response/booking/booking_detail_response.dart';
import 'package:data/remote/response/booking/user_bookings_response.dart';
import 'package:data/util/date_time_util.dart';
import 'package:domain/model/skyClubModels/bookedFlightInfo.dart';
import 'package:domain/model/skyClubModels/booking.dart';
import 'package:domain/model/skyClubModels/booking_detail_content.dart';
import 'package:domain/model/skyClubModels/booking_stats.dart';
import 'package:domain/repository/booking_details_repository.dart';
import 'package:domain/model/skyClubModels/booking_list_and_stats.dart';


class BookingDetailsRepositoryImpl implements BookingDetailsRepository {
  final BookingDetailsApiService apiService;

  BookingDetailsRepositoryImpl({required this.apiService});

  @override
  Future<BookingListAndStats> getMyBookings() async {


      final List<UserBookingsResponse> response = await apiService.getBookings();

      final List<Booking> bookings =
      BookingMapper.mapUserBookingsResponseListToBookingList(response);
      final BookingStats stats = BookingStats.calculateStats(response);

      return BookingListAndStats(bookingList: bookings, bookingStats: stats);

  }

  @override
  Future<BookingDetailContent> getBookingById(
      {required String bookingId}) async {
    final BookingDetailsResponse response =
        await apiService.getBookingById(bookingId: bookingId);
    //debugPrint(response.bookingId);
    //response.fareRules.isNotEmpty ?  BKFareRulesMapper.listFromResponse(response.fareRules, response) : []

    final flightInfo = BookedFlightInfo(
      flightNumber: response.flights.first.flightNumber.toString(),
      departureCity: response.flights.first.fromAirportCode ?? '',
      arrivalCity: response.flights.first.toAirportCode ?? '',
      departureDate: DateTimeUtils.getDayMonthYearDDMMMYYYY(response.flights.first.departureDate),
    );

    final model = BookingDetailContent(
      passengerInfoList:
          BKPassengerInfoMapper.mapListBDPassengerToPassengerInfoModel(
              response.segments.first.passangers),
      baggageFareList:
          BKBaggageAndFareMapper.mapListBDsegmentToBaggageFareModel(
              response.segments, response.bookingDetailsFare),
      fareRulesList: response.fareRules.isNotEmpty
          ? BKFareRulesMapper.listFromResponse(response.fareRules, response)
          : [],
      travelItineraryList:
          BKTravelItineraryMapper.mapToTravelItineraryModels(response.flights),
      bookingStatus: response.status,
      flightInfo: flightInfo
    );

    return model;
  }

  @override
  Future<bool> cancelBooking(
      {required String bookingId,
      required String reason,
      required String comment,
      required List<File> files}) async {
    final bool response = await apiService.cancelBooking(
        bookingId: bookingId, reason: reason, comment: comment, files: files);
    return response;
  }

  @override
  Future<String> makePayment({required String bookingId}) async {
    final String response = await apiService.makePayment(bookingId: bookingId);
    return response;
  }
}
