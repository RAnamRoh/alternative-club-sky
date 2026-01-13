import 'package:domain/enum/seat_class.dart';
import 'package:domain/enum/travel_way.dart';
import 'package:domain/model/skyClubModels/airport.dart';
import 'package:domain/model/skyClubModels/multi_city_journey.dart';
import 'package:club_alt/presentation/util/date_to_string.dart';
import 'package:data/remote/request/search_flight_ticket_request.dart';

class SearchFlightDetails {

  final TravelWay travelWay;
  final Airport departureAirport;
  final Airport arrivalAirport;
  final DateTime departureDate;
  final DateTime? returnDate;
  final int numberOfAdults;
  final int numberOfChildren;
  final int numberOfInfants;
  final SeatClass seatClass;
  final List<MultiCityJourney>? multiCityJourney;
  int get numberOfPassengers => numberOfAdults + numberOfChildren + numberOfInfants;

  SearchFlightDetails({
    required this.travelWay,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.departureDate,
    required this.returnDate,
    required this.numberOfAdults,
    required this.numberOfChildren,
    required this.numberOfInfants,
    required this.seatClass,
    this.multiCityJourney
  });


  SearchFlightTicketRequest toSearchFlightTicketRequest() {
    // Create Passengers List
    final passengers = <PassengerRequestModel>[
      PassengerRequestModel(code: "ADT", quantity: numberOfAdults),
    ];

    if (numberOfChildren > 0) {
      passengers.add(PassengerRequestModel(code: "CNN", quantity: numberOfChildren));
    }

    if (numberOfInfants > 0) {
      passengers.add(PassengerRequestModel(code: "INF", quantity: numberOfInfants));
    }


    if (multiCityJourney != null) {

      final List<JourneyRequestModel> journeys = multiCityJourney!.map((multiCityJourney) {
        return JourneyRequestModel(
          departureDateTime: DateToString.formatToIso8601(multiCityJourney.departureDate),
          originLocation: LocationRequestModel(locationCode: multiCityJourney.departureAirport.code),
          destinationLocation: LocationRequestModel(locationCode: multiCityJourney.arrivalAirport.code),
        );
      }).toList();

      return SearchFlightTicketRequest(
        preferredCabin: seatClass.seatName,
        passengers: passengers,
        journey: journeys,
      );

    }else {
      // Create Journey List
      final journey = <JourneyRequestModel>[
        JourneyRequestModel(
          departureDateTime:  DateToString.formatToIso8601(departureDate),
          originLocation: LocationRequestModel(locationCode: departureAirport.code),
          destinationLocation: LocationRequestModel(locationCode: arrivalAirport.code),
        ),
      ];

      if (returnDate != null) {
        journey.add(JourneyRequestModel(
          departureDateTime: DateToString.formatToIso8601(returnDate!),
          originLocation: LocationRequestModel(locationCode: arrivalAirport.code),
          destinationLocation: LocationRequestModel(locationCode: departureAirport.code),
        ));
      }

      // Create and return the request
      return SearchFlightTicketRequest(
        preferredCabin: seatClass.seatName,
        passengers: passengers,
        journey: journey,
      );
    }


  }


}