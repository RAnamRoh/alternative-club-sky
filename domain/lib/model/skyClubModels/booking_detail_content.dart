
import 'package:domain/model/skyClubModels/bookedFlightInfo.dart';
import 'package:domain/model/skyClubModels/fare_rules_model.dart';
import 'package:domain/model/skyClubModels/passenger_info_model.dart';
import 'package:domain/model/skyClubModels/travel_itinerary_model.dart';

import 'baggage_fare_model.dart';

class BookingDetailContent {
  final List<PassengerInfoModel> passengerInfoList;
  final List<BaggageFareModel> baggageFareList;
  final List<FareRulesModel> fareRulesList;
  final List<TravelItineraryModel> travelItineraryList;
  final String bookingStatus;
  final BookedFlightInfo flightInfo;

  BookingDetailContent({
    required this.passengerInfoList,
    required this.baggageFareList,
    required this.fareRulesList,
    required this.travelItineraryList,
    required this.bookingStatus,
    required this.flightInfo
  });
}