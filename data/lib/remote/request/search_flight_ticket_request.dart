import 'dart:convert';

class SearchFlightTicketRequest {
  final String preferredCabin;
  final List<PassengerRequestModel> passengers;
  final List<JourneyRequestModel> journey;

  SearchFlightTicketRequest({
    required this.preferredCabin,
    required this.passengers,
    required this.journey,
  });

  Map<String, dynamic> toJson() => {
    'preferredCabin': preferredCabin,
    'passengers': passengers.map((p) => p.toJson()).toList(),
    'journey': journey.map((j) => j.toJson()).toList(),
  };

  String toJsonString() => jsonEncode(toJson());
}

class PassengerRequestModel {
  final String code;
  final int quantity;

  PassengerRequestModel({
    required this.code,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
    'code': code,
    'quantity': quantity,
  };
}

class JourneyRequestModel {
  final String departureDateTime;
  final LocationRequestModel originLocation;
  final LocationRequestModel destinationLocation;

  JourneyRequestModel({
    required this.departureDateTime,
    required this.originLocation,
    required this.destinationLocation,
  });

  Map<String, dynamic> toJson() => {
    'departureDateTime': departureDateTime,
    'originLocation': originLocation.toJson(),
    'destinationLocation': destinationLocation.toJson(),
  };
}

class LocationRequestModel {
  final String locationCode;

  LocationRequestModel({
    required this.locationCode,
  });

  Map<String, dynamic> toJson() => {
    'locationCode': locationCode,
  };
}
