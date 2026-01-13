// To parse this JSON data, do:
//
//     final flightResponse = flightResponseFromJson(jsonString);

import 'dart:convert';

class FlightResponse {
  final List<Flight> flights;
  final List<Airline> airlines;

  FlightResponse({
    required this.flights,
    required this.airlines,
  });

  factory FlightResponse.fromRawJson(String str) => FlightResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FlightResponse.fromJson(Map<String, dynamic> json) => FlightResponse(
    flights: List<Flight>.from(json["flights"].map((x) => Flight.fromJson(x))),
    airlines: List<Airline>.from(json["airlines"].map((x) => Airline.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "flights": List<dynamic>.from(flights.map((x) => x.toJson())),
    "airlines": List<dynamic>.from(airlines.map((x) => x.toJson())),
  };
}

class Flight {
  final int id;
  final List<Journey> journeys;
  final String lastTicketDate;
  final String lastTicketTime;
  final bool eTicketable;
  final DateTime departureDate;
  final String departureDateTimeOffset;
  final DateTime returnDateTime;
  final String returnDateTimeOffset;
  final String gdsOfferSource;
  final TotalFare totalFare;
  final List<PassengerTotalFare> passengerTotalFare;
  final bool isRefundable;
  final bool isRoundTrip;
  final String validatingCarrierCode;
  final ValidatingCarrier validatingCarrier;

  Flight({
    required this.id,
    required this.journeys,
    required this.lastTicketDate,
    required this.lastTicketTime,
    required this.eTicketable,
    required this.departureDate,
    required this.departureDateTimeOffset,
    required this.returnDateTime,
    required this.returnDateTimeOffset,
    required this.gdsOfferSource,
    required this.totalFare,
    required this.passengerTotalFare,
    required this.isRefundable,
    required this.isRoundTrip,
    required this.validatingCarrierCode,
    required this.validatingCarrier,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    id: json["id"],
    journeys: List<Journey>.from(json["journeys"].map((x) => Journey.fromJson(x))),
    lastTicketDate: json["lastTicketDate"],
    lastTicketTime: json["lastTicketTime"],
    eTicketable: json["eTicketable"],
    departureDate: DateTime.parse(json["departureDate"]),
    departureDateTimeOffset: json["departureDateTimeOffset"],
    returnDateTime: DateTime.parse(json["returnDateTime"] ?? "0000-00-00T00:00:00"),
    returnDateTimeOffset: json["returnDateTimeOffset"] ?? "00:00:00+00:00",
    gdsOfferSource: json["gdsOfferSource"],
    totalFare: TotalFare.fromJson(json["totalFare"]),
    passengerTotalFare: List<PassengerTotalFare>.from(json["passengerTotalFare"].map((x) => PassengerTotalFare.fromJson(x))),
    isRefundable: json["isRefundable"],
    isRoundTrip: json["isRoundTrip"],
    validatingCarrierCode: json["validatingCarrierCode"],
    validatingCarrier: ValidatingCarrier.fromJson(json["validatingCarrier"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "journeys": List<dynamic>.from(journeys.map((x) => x.toJson())),
    "lastTicketDate": lastTicketDate,
    "lastTicketTime": lastTicketTime,
    "eTicketable": eTicketable,
    "departureDate": departureDate.toIso8601String(),
    "departureDateTimeOffset": departureDateTimeOffset,
    "returnDateTime": returnDateTime.toIso8601String(),
    "returnDateTimeOffset": returnDateTimeOffset,
    "gdsOfferSource": gdsOfferSource,
    "totalFare": totalFare.toJson(),
    "passengerTotalFare": List<dynamic>.from(passengerTotalFare.map((x) => x.toJson())),
    "isRefundable": isRefundable,
    "isRoundTrip": isRoundTrip,
    "validatingCarrierCode": validatingCarrierCode,
    "validatingCarrier": validatingCarrier.toJson(),
  };
}

class Journey {
  final String direction;
  final int durationMinutes;
  final DateTime departureDateTime;
  final String departureDateTimeOffset;
  final DateTime arrivalDateTime;
  final String arrivalDateTimeOffset;
  final String originCode;
  final String destinationCode;
  final Airport origin;
  final Airport destination;
  final List<Segment> segments;

  Journey({
    required this.direction,
    required this.durationMinutes,
    required this.departureDateTime,
    required this.departureDateTimeOffset,
    required this.arrivalDateTime,
    required this.arrivalDateTimeOffset,
    required this.originCode,
    required this.destinationCode,
    required this.origin,
    required this.destination,
    required this.segments,
  });

  factory Journey.fromJson(Map<String, dynamic> json) => Journey(
    direction: json["direction"],
    durationMinutes: json["durationMinutes"],
    departureDateTime: DateTime.parse(json["departureDateTime"]),
    departureDateTimeOffset: json["departureDateTimeOffset"],
    arrivalDateTime: DateTime.parse(json["arrivalDateTime"]),
    arrivalDateTimeOffset: json["arrivalDateTimeOffset"],
    originCode: json["originCode"],
    destinationCode: json["destinationCode"],
    origin: Airport.fromJson(json["origin"]),
    destination: Airport.fromJson(json["destination"]),
    segments: List<Segment>.from(json["segments"].map((x) => Segment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "direction": direction,
    "durationMinutes": durationMinutes,
    "departureDateTime": departureDateTime.toIso8601String(),
    "departureDateTimeOffset": departureDateTimeOffset,
    "arrivalDateTime": arrivalDateTime.toIso8601String(),
    "arrivalDateTimeOffset": arrivalDateTimeOffset,
    "originCode": originCode,
    "destinationCode": destinationCode,
    "origin": origin.toJson(),
    "destination": destination.toJson(),
    "segments": List<dynamic>.from(segments.map((x) => x.toJson())),
  };
}

class Segment {
  final int id;
  final int fareRef;
  final String direction;
  final String flightNumber;
  final String aircraftName;
  final DateTime departureDate;
  final String departureDateTimeOffset;
  final DateTime arrivalDate;
  final String arrivalDateTimeOffset;
  final int durationMinutes;
  final String operatorCode;
  final String vehicleType;
  final String marketingCode;
  final Operator operator;
  final Marketing marketing;
  final String originCode;
  final String destinationCode;
  final Airport origin;
  final Airport destination;
  final int technicalStops;
  final List<Baggage> baggages;
  final List<PassengerSegmentUtil> passengerSegmentUtils;
  final int selectedSeats;

  Segment({
    required this.id,
    required this.fareRef,
    required this.direction,
    required this.flightNumber,
    required this.aircraftName,
    required this.departureDate,
    required this.departureDateTimeOffset,
    required this.arrivalDate,
    required this.arrivalDateTimeOffset,
    required this.durationMinutes,
    required this.operatorCode,
    required this.vehicleType,
    required this.marketingCode,
    required this.operator,
    required this.marketing,
    required this.originCode,
    required this.destinationCode,
    required this.origin,
    required this.destination,
    required this.technicalStops,
    required this.baggages,
    required this.passengerSegmentUtils,
    required this.selectedSeats,
  });

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
    id: json["id"],
    fareRef: json["fareRef"],
    direction: json["direction"],
    flightNumber: json["flightNumber"],
    aircraftName: json["aircraftName"] ?? "",
    departureDate: DateTime.parse(json["departureDate"]),
    departureDateTimeOffset: json["departureDateTimeOffset"],
    arrivalDate: DateTime.parse(json["arrivalDate"]),
    arrivalDateTimeOffset: json["arrivalDateTimeOffset"],
    durationMinutes: json["durationMinutes"],
    operatorCode: json["operatorCode"],
    vehicleType: json["vehicleType"],
    marketingCode: json["marketingCode"],
    operator: Operator.fromJson(json["operator"]),
    marketing: Marketing.fromJson(json["marketing"]),
    originCode: json["originCode"],
    destinationCode: json["destinationCode"],
    origin: Airport.fromJson(json["origin"]),
    destination: Airport.fromJson(json["destination"]),
    technicalStops: json["technicalStops"],
    baggages: json["baggages"] == null || json["baggages"].isEmpty
        ? []
        : List<Baggage>.from(json["baggages"].map((x) => Baggage.fromJson(x))),
    passengerSegmentUtils: List<PassengerSegmentUtil>.from(json["passengerSegmentUtils"].map((x) => PassengerSegmentUtil.fromJson(x))),
    selectedSeats: json["selectedSeats"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fareRef": fareRef,
    "direction": direction,
    "flightNumber": flightNumber,
    "aircraftName": aircraftName,
    "departureDate": departureDate.toIso8601String(),
    "departureDateTimeOffset": departureDateTimeOffset,
    "arrivalDate": arrivalDate.toIso8601String(),
    "arrivalDateTimeOffset": arrivalDateTimeOffset,
    "durationMinutes": durationMinutes,
    "operatorCode": operatorCode,
    "vehicleType": vehicleType,
    "marketingCode": marketingCode,
    "operator": operator.toJson(),
    "marketing": marketing.toJson(),
    "originCode": originCode,
    "destinationCode": destinationCode,
    "origin": origin.toJson(),
    "destination": destination.toJson(),
    "technicalStops": technicalStops,
   "baggages": List<dynamic>.from(baggages.map((x) => x.toJson())),
    "passengerSegmentUtils": List<dynamic>.from(passengerSegmentUtils.map((x) => x.toJson())),
    "selectedSeats": selectedSeats,
  };
}

class Airport {
  final String airportCode;
  final String cityCode;
  final String countryCode;

  Airport({
    required this.airportCode,
    required this.cityCode,
    required this.countryCode,
  });

  factory Airport.fromJson(Map<String, dynamic> json) => Airport(
    airportCode: json["airportCode"],
    cityCode: json["cityCode"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "airportCode": airportCode,
    "cityCode": cityCode,
    "countryCode": countryCode,
  };
}

class Baggage {
  final String passengerType;
  final int includedBaggageQuantity;
  final int includedBaggageWeight;
  final String description1;
  final String description2;

  Baggage({
    required this.passengerType,
    required this.includedBaggageQuantity,
    required this.includedBaggageWeight,
    required this.description1,
    required this.description2,
  });

  factory Baggage.fromJson(Map<String, dynamic> json) => Baggage(
    passengerType: json["passengerType"],
    includedBaggageQuantity: json["includedBaggageQuantity"],
    includedBaggageWeight: json["includedBaggageWeight"],
    description1: json["description1"] ?? "",
    description2: json["description2"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "passengerType": passengerType,
    "includedBaggageQuantity": includedBaggageQuantity,
    "includedBaggageWeight": includedBaggageWeight,
    "description1": description1,
    "description2": description2,
  };
}

class Marketing {
  final String airlineCode;
  final String airlineName;
  final String airlineLogo;
  final String flightNumber;
  final bool requiresPassport;

  Marketing({
    required this.airlineCode,
    required this.airlineName,
    required this.airlineLogo,
    required this.flightNumber,
    required this.requiresPassport,
  });

  factory Marketing.fromJson(Map<String, dynamic> json) => Marketing(
    airlineCode: json["airlineCode"],
    airlineName: json["airlineName"],
    airlineLogo: json["airlineLogo"],
    flightNumber: json["flightNumber"],
    requiresPassport: json["requiresPassport"],
  );

  Map<String, dynamic> toJson() => {
    "airlineCode": airlineCode,
    "airlineName": airlineName,
    "airlineLogo": airlineLogo,
    "flightNumber": flightNumber,
    "requiresPassport": requiresPassport,
  };
}

class Operator {
  final String airlineCode;
  final String flightNumber;
  final bool requiresPassport;

  Operator({
    required this.airlineCode,
    required this.flightNumber,
    required this.requiresPassport,
  });

  factory Operator.fromJson(Map<String, dynamic> json) => Operator(
    airlineCode: json["airlineCode"],
    flightNumber: json["flightNumber"],
    requiresPassport: json["requiresPassport"],
  );

  Map<String, dynamic> toJson() => {
    "airlineCode": airlineCode,
    "flightNumber": flightNumber,
    "requiresPassport": requiresPassport,
  };
}

class PassengerSegmentUtil {
  final String passengerType;
  final String cabinClassCode;
  final String cabinClassName;
  final String fareBasisCode;
  final String bookingClassCode;
  final String mealCode;
  final int seatsAvailable;

  PassengerSegmentUtil({
    required this.passengerType,
    required this.cabinClassCode,
    required this.cabinClassName,
    required this.fareBasisCode,
    required this.bookingClassCode,
    required this.mealCode,
    required this.seatsAvailable,
  });

  factory PassengerSegmentUtil.fromJson(Map<String, dynamic> json) => PassengerSegmentUtil(
    passengerType: json["passengerType"],
    cabinClassCode: json["cabinClassCode"],
    cabinClassName: json["cabinClassName"],
    fareBasisCode: json["fareBasisCode"],
    bookingClassCode: json["bookingClassCode"],
    mealCode: json["mealCode"] ?? "",
    seatsAvailable: json["seatsAvailable"],
  );

  Map<String, dynamic> toJson() => {
    "passengerType": passengerType,
    "cabinClassCode": cabinClassCode,
    "cabinClassName": cabinClassName,
    "fareBasisCode": fareBasisCode,
    "bookingClassCode": bookingClassCode,
    "mealCode": mealCode,
    "seatsAvailable": seatsAvailable,
  };
}

class TotalFare {
  final double totalPrice;
  final double platformFee;
  final double totalTaxAmount;
  final String currency;
  final double baseFareAmount;
  final double constructionAmount;
  final double equivalentAmount;
  final List<TaxSummary> taxSummaries;

  TotalFare({
    required this.totalPrice,
    required this.platformFee,
    required this.totalTaxAmount,
    required this.currency,
    required this.baseFareAmount,
    required this.constructionAmount,
    required this.equivalentAmount,
    required this.taxSummaries,
  });

  factory TotalFare.fromJson(Map<String, dynamic> json) => TotalFare(
    totalPrice: json["totalPrice"]?.toDouble(),
    platformFee: json["platformFee"]?.toDouble(),
    totalTaxAmount: json["totalTaxAmount"]?.toDouble(),
    currency: json["currency"],
    baseFareAmount: json["baseFareAmount"]?.toDouble(),
    constructionAmount: json["constructionAmount"]?.toDouble(),
    equivalentAmount: json["equivalentAmount"]?.toDouble(),
    taxSummaries: List<TaxSummary>.from(json["taxSummaries"].map((x) => TaxSummary.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalPrice": totalPrice,
    "platformFee": platformFee,
    "totalTaxAmount": totalTaxAmount,
    "currency": currency,
    "baseFareAmount": baseFareAmount,
    "constructionAmount": constructionAmount,
    "equivalentAmount": equivalentAmount,
    "taxSummaries": List<dynamic>.from(taxSummaries.map((x) => x.toJson())),
  };
}

class PassengerTotalFare {
  final String passengerType;
  final double totalFare;
  final double totalTaxAmount;
  final String currency;
  final double baseFareAmount;
  final double equivalentAmount;
  final double constructionAmount;
  final double exchangeRateOne;
  final bool isRefundable;
  final List<Penalty> penalties;
  final List<TaxSummary> taxSummaries;

  PassengerTotalFare({
    required this.passengerType,
    required this.totalFare,
    required this.totalTaxAmount,
    required this.currency,
    required this.baseFareAmount,
    required this.equivalentAmount,
    required this.constructionAmount,
    required this.exchangeRateOne,
    required this.isRefundable,
    required this.penalties,
    required this.taxSummaries,
  });

  factory PassengerTotalFare.fromJson(Map<String, dynamic> json) => PassengerTotalFare(
    passengerType: json["passengerType"],
    totalFare: json["totalFare"]?.toDouble(),
    totalTaxAmount: json["totalTaxAmount"]?.toDouble(),
    currency: json["currency"],
    baseFareAmount: json["baseFareAmount"]?.toDouble(),
    equivalentAmount: json["equivalentAmount"]?.toDouble(),
    constructionAmount: json["constructionAmount"]?.toDouble(),
    exchangeRateOne: json["exchangeRateOne"]?.toDouble(),
    isRefundable: json["isRefundable"],
    penalties: List<Penalty>.from(json["penalties"].map((x) => Penalty.fromJson(x))),
    taxSummaries: List<TaxSummary>.from(json["taxSummaries"].map((x) => TaxSummary.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "passengerType": passengerType,
    "totalFare": totalFare,
    "totalTaxAmount": totalTaxAmount,
    "currency": currency,
    "baseFareAmount": baseFareAmount,
    "equivalentAmount": equivalentAmount,
    "constructionAmount": constructionAmount,
    "exchangeRateOne": exchangeRateOne,
    "isRefundable": isRefundable,
    "penalties": List<dynamic>.from(penalties.map((x) => x.toJson())),
    "taxSummaries": List<dynamic>.from(taxSummaries.map((x) => x.toJson())),
  };
}

class Penalty {
  final String type;
  final String applicability;
  final bool changeable;
  final double amount;
  final String? currency;
  final bool? refundable;

  Penalty({
    required this.type,
    required this.applicability,
    required this.changeable,
    required this.amount,
    this.currency,
    this.refundable,
  });

  factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
    type: json["type"],
    applicability: json["applicability"],
    changeable: json["changeable"],
    amount: json["amount"]?.toDouble(),
    currency: json["currency"],
    refundable: json["refundable"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "applicability": applicability,
    "changeable": changeable,
    "amount": amount,
    "currency": currency,
    "refundable": refundable,
  };
}

class TaxSummary {
  final String code;
  final double amount;
  final String currency;
  final String description;

  TaxSummary({
    required this.code,
    required this.amount,
    required this.currency,
    required this.description,
  });

  factory TaxSummary.fromJson(Map<String, dynamic> json) => TaxSummary(
    code: json["code"],
    amount: json["amount"]?.toDouble(),
    currency: json["currency"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "amount": amount,
    "currency": currency,
    "description": description,
  };
}

class ValidatingCarrier {
  final String airlineCode;
  final bool requiresPassport;

  ValidatingCarrier({
    required this.airlineCode,
    required this.requiresPassport,
  });

  factory ValidatingCarrier.fromJson(Map<String, dynamic> json) => ValidatingCarrier(
    airlineCode: json["airlineCode"],
    requiresPassport: json["requiresPassport"],
  );

  Map<String, dynamic> toJson() => {
    "airlineCode": airlineCode,
    "requiresPassport": requiresPassport,
  };
}

class Airline {
  final String name;
  final String code;
  final bool isLowCost;
  final String logo;

  Airline({
    required this.name,
    required this.code,
    required this.isLowCost,
    required this.logo,
  });

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
    name: json["name"],
    code: json["code"],
    isLowCost: json["isLowCost"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "isLowCost": isLowCost,
    "logo": logo,
  };
}