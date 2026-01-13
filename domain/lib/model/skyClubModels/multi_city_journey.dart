import 'package:domain/model/skyClubModels/airport.dart';

class MultiCityJourney {
  Airport departureAirport;
  Airport arrivalAirport;
  DateTime departureDate;

  MultiCityJourney({
    required this.departureAirport,
    required this.arrivalAirport,
    required this.departureDate,
  });
}