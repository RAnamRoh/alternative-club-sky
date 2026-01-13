import 'package:domain/model/skyClubModels/fare_rules_model.dart';

class BookingDetailsResponse {
  String pnr;
  String bookingId;
  DateTime startDate;
  DateTime endDate;
  bool isCancelable;
  bool isTicketed;
  String firstName;
  String lastName;
  String address;
  String emails;
  String phones;
  String faxes;
  String emergencyPhones;
  String status;
  DateTime timestamp;
  int total;
  TravelersGroup travelersGroup;
  List<BDFlight> flights;
  List<FareRule> fareRules;
  List<dynamic> flightTickets;
  List<Event> events;
  BookingDetailsFare bookingDetailsFare;
  List<BDSegment> segments;

  BookingDetailsResponse({
    required this.pnr,
    required this.bookingId,
    required this.startDate,
    required this.endDate,
    required this.isCancelable,
    required this.isTicketed,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.emails,
    required this.phones,
    required this.faxes,
    required this.emergencyPhones,
    required this.status,
    required this.timestamp,
    required this.total,
    required this.travelersGroup,
    required this.flights,
    required this.fareRules,
    required this.flightTickets,
    required this.events,
    required this.bookingDetailsFare,
    required this.segments,
  });

  factory BookingDetailsResponse.fromJson(Map<String, dynamic> json) {
    return BookingDetailsResponse(
      pnr: json['pnr'],
      bookingId: json['bookingId'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      isCancelable: json['isCancelable'],
      isTicketed: json['isTicketed'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['address'],
      emails: json['emails'],
      phones: json['phones'],
      faxes: json['faxes'],
      emergencyPhones: json['emergencyPhones'],
      status: json['status'],
      timestamp: DateTime.parse(json['timestamp']),
      total: json['total'],
      travelersGroup: TravelersGroup.fromJson(json['travelersGroup']),
      flights:
          List<BDFlight>.from(json['flights'].map((x) => BDFlight.fromJson(x))),
      fareRules: List<FareRule>.from(
          json['fareRules'].map((x) => FareRule.fromJson(x))),
      flightTickets: List<dynamic>.from(json['flightTickets'].map((x) => x)),
      events: List<Event>.from(json['events'].map((x) => Event.fromJson(x))),
      bookingDetailsFare:
          BookingDetailsFare.fromJson(json['bookingDetailsFare']),
      segments: List<BDSegment>.from(
          json['segments'].map((x) => BDSegment.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pnr': pnr,
      'bookingId': bookingId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'isCancelable': isCancelable,
      'isTicketed': isTicketed,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'emails': emails,
      'phones': phones,
      'faxes': faxes,
      'emergencyPhones': emergencyPhones,
      'status': status,
      'timestamp': timestamp.toIso8601String(),
      'total': total,
      'travelersGroup': travelersGroup.toJson(),
      'flights': List<dynamic>.from(flights.map((x) => x.toJson())),
      'fareRules': List<dynamic>.from(fareRules.map((x) => x.toJson())),
      'flightTickets': List<dynamic>.from(flightTickets.map((x) => x)),
      'events': List<dynamic>.from(events.map((x) => x.toJson())),
      'bookingDetailsFare': bookingDetailsFare.toJson(),
      'segments': List<dynamic>.from(segments.map((x) => x.toJson())),
    };
  }
}

class BookingDetailsFare {
  double airlineFee;
  double platformFee;
  int total;
  int smsFee;
  int paymentGatewayFee;
  String currencyCode;

  BookingDetailsFare({
    required this.airlineFee,
    required this.platformFee,
    required this.total,
    required this.smsFee,
    required this.paymentGatewayFee,
    required this.currencyCode,
  });

  factory BookingDetailsFare.fromJson(Map<String, dynamic> json) =>
      BookingDetailsFare(
        airlineFee: json["airlineFee"]?.toDouble() ?? 0.0,
        platformFee: json["platformFee"]?.toDouble() ?? 0.0,
        total: json["total"]?.toInt() ?? 0,
        smsFee: json["smsFee"]?.toInt() ?? 0,
        paymentGatewayFee: json["paymentGatewayFee"]?.toInt() ?? 0,
        currencyCode: json["currencyCode"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "airlineFee": airlineFee,
        "platformFee": platformFee,
        "total": total,
        "smsFee": smsFee,
        "paymentGatewayFee": paymentGatewayFee,
        "currencyCode": currencyCode,
      };
}

class Event {
  String eventName;
  DateTime eventAt;
  String eventBy;
  String message;

  Event({
    required this.eventName,
    required this.eventAt,
    required this.eventBy,
    required this.message,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        eventName: json["eventName"],
        eventAt: DateTime.parse(json["eventAt"]),
        eventBy: json["eventBy"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "eventName": eventName,
        "eventAt": eventAt.toIso8601String(),
        "eventBy": eventBy,
        "message": message,
      };
}

class FareRule {
  String originAirportCode;
  String destinationAirportCode;
  String owningAirlineCode;
  String passengerCode;
  bool isRefundable;
  List<RefundPenalty> refundPenalties;
  bool isChangeable;
  List<ExchangePenalty> exchangePenalties;

  FareRule({
    required this.originAirportCode,
    required this.destinationAirportCode,
    required this.owningAirlineCode,
    required this.passengerCode,
    required this.isRefundable,
    required this.refundPenalties,
    required this.isChangeable,
    required this.exchangePenalties,
  });

  factory FareRule.fromJson(Map<String, dynamic> json) => FareRule(
        originAirportCode: json["originAirportCode"] ?? "",
        destinationAirportCode: json["destinationAirportCode"] ?? "",
        owningAirlineCode: json["owningAirlineCode"] ?? "",
        passengerCode: json["passengerCode"] ?? "",
        isRefundable: json["isRefundable"],
        refundPenalties: json["refundPenalties"] != null
            ? List<RefundPenalty>.from(
                json["refundPenalties"].map((x) => RefundPenalty.fromJson(x)))
            : [],
        // refundPenalties: List<RefundPenalty>.from(json["refundPenalties"].map((x) => RefundPenalty.fromJson(x))),
        isChangeable: json["isChangeable"],
        exchangePenalties: List<ExchangePenalty>.from(
            json["exchangePenalties"].map((x) => ExchangePenalty.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "originAirportCode": originAirportCode,
        "destinationAirportCode": destinationAirportCode,
        "owningAirlineCode": owningAirlineCode,
        "passengerCode": passengerCode,
        "isRefundable": isRefundable,
        "refundPenalties":
            List<dynamic>.from(refundPenalties.map((x) => x.toJson())),
        "isChangeable": isChangeable,
        "exchangePenalties":
            List<dynamic>.from(exchangePenalties.map((x) => x.toJson())),
      };
}

class ExchangePenalty {
  String applicability;
  bool conditionsApply;
  Penalty penalty;

  ExchangePenalty({
    required this.applicability,
    required this.conditionsApply,
    required this.penalty,
  });

  factory ExchangePenalty.fromJson(Map<String, dynamic> json) =>
      ExchangePenalty(
        applicability: json["applicability"],
        conditionsApply: json["conditionsApply"],
        penalty: Penalty.fromJson(json["penalty"]),
      );

  Map<String, dynamic> toJson() => {
        "applicability": applicability,
        "conditionsApply": conditionsApply,
        "penalty": penalty.toJson(),
      };

  ExchangePenaltyModel toDomain() {
    return ExchangePenaltyModel(
      applicability: applicability,
      conditionsApply: conditionsApply, // Convert bool to String
      penalty:
          penalty.toDomain(), // Assuming Penalty → PenaltyModel mapping exists
    );
  }

  static List<ExchangePenaltyModel> listToDomain(List<ExchangePenalty> list) =>
      list.map((e) => e.toDomain()).toList();
}

class Penalty {
  String amount;
  String currencyCode;

  Penalty({
    required this.amount,
    required this.currencyCode,
  });

  factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
        amount: json["amount"],
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCode,
      };

  PenaltyModel toDomain() {
    return PenaltyModel(
      amount: amount,
      currency: currencyCode,
    );
  }
}

class RefundPenalty {
  String applicability;
  bool conditionsApply;
  Penalty penalty;
  DateTime applicableFromDate;
  DateTime applicableToDate;

  RefundPenalty({
    required this.applicability,
    required this.conditionsApply,
    required this.penalty,
    required this.applicableFromDate,
    required this.applicableToDate,
  });

  factory RefundPenalty.fromJson(Map<String, dynamic> json) => RefundPenalty(
        applicability: json["applicability"],
        conditionsApply: json["conditionsApply"],
        penalty: Penalty.fromJson(json["penalty"]),
        applicableFromDate: DateTime.parse(json["applicableFromDate"]),
        applicableToDate: DateTime.parse(json["applicableToDate"]),
      );

  Map<String, dynamic> toJson() => {
        "applicability": applicability,
        "conditionsApply": conditionsApply,
        "penalty": penalty.toJson(),
        "applicableFromDate": applicableFromDate.toIso8601String(),
        "applicableToDate": applicableToDate.toIso8601String(),
      };
  RefundPenaltyModel toDomain() {
    return RefundPenaltyModel(
      applicability: applicability,
      conditionsApply: conditionsApply,
      penalty: penalty
          .toDomain(), // Assuming a similar mapping for Penalty → PenaltyModel
      applicableFromDate: applicableFromDate,
      applicableToDate: applicableToDate,
    );
  }

  static List<RefundPenaltyModel> listToDomain(List<RefundPenalty> list) =>
      list.map((e) => e.toDomain()).toList();
}

class BDFlight {
  int flightNumber;
  String airlineCode;
  String airlineName;
  int operatingFlightNumber;
  String operatingAirlineCode;
  String operatingAirlineName;
  String fromAirportCode;
  String toAirportCode;
  DateTime departureDate;
  String departureTime;
  String departureTerminalName;
  String departureGate;
  DateTime arrivalDate;
  String arrivalTime;
  int numberOfSeats;
  String cabinTypeName;
  String cabinTypeCode;
  String aircraftTypeCode;
  String aircraftTypeName;
  String bookingClass;
  String flightStatusCode;
  String flightStatusName;
  int durationInMinutes;
  int distanceInMiles;
  List<int> travelerIndices;
  bool isPast;
  bool isMarriageGroup;
  String source;

  BDFlight({
    required this.flightNumber,
    required this.airlineCode,
    required this.airlineName,
    required this.operatingFlightNumber,
    required this.operatingAirlineCode,
    required this.operatingAirlineName,
    required this.fromAirportCode,
    required this.toAirportCode,
    required this.departureDate,
    required this.departureTime,
    required this.departureTerminalName,
    required this.departureGate,
    required this.arrivalDate,
    required this.arrivalTime,
    required this.numberOfSeats,
    required this.cabinTypeName,
    required this.cabinTypeCode,
    required this.aircraftTypeCode,
    required this.aircraftTypeName,
    required this.bookingClass,
    required this.flightStatusCode,
    required this.flightStatusName,
    required this.durationInMinutes,
    required this.distanceInMiles,
    required this.travelerIndices,
    required this.isPast,
    required this.isMarriageGroup,
    required this.source,
  });

  factory BDFlight.fromJson(Map<String, dynamic> json) {
    return BDFlight(
      flightNumber: json['flightNumber'],
      airlineCode: json['airlineCode'],
      airlineName: json['airlineName'],
      operatingFlightNumber: json['operatingFlightNumber'],
      operatingAirlineCode: json['operatingAirlineCode'],
      operatingAirlineName: json['operatingAirlineName'],
      fromAirportCode: json['fromAirportCode'],
      toAirportCode: json['toAirportCode'],
      departureDate: DateTime.parse(json['departureDate']),
      departureTime: json['departureTime'],
      departureTerminalName: json['departureTerminalName'] ?? '',
      departureGate: json['departureGate'] ?? '',
      arrivalDate: DateTime.parse(json['arrivalDate']),
      arrivalTime: json['arrivalTime'],
      numberOfSeats: json['numberOfSeats'],
      cabinTypeName: json['cabinTypeName'],
      cabinTypeCode: json['cabinTypeCode'],
      aircraftTypeCode: json['aircraftTypeCode'],
      aircraftTypeName: json['aircraftTypeName'],
      bookingClass: json['bookingClass'],
      flightStatusCode: json['flightStatusCode'],
      flightStatusName: json['flightStatusName'],
      durationInMinutes: json['durationInMinutes'],
      distanceInMiles: json['distanceInMiles'],
      travelerIndices: List<int>.from(json['travelerIndices']),
      isPast: json['isPast'],
      isMarriageGroup: json['isMarriageGroup'],
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flightNumber': flightNumber,
      'airlineCode': airlineCode,
      'airlineName': airlineName,
      'operatingFlightNumber': operatingFlightNumber,
      'operatingAirlineCode': operatingAirlineCode,
      'operatingAirlineName': operatingAirlineName,
      'fromAirportCode': fromAirportCode,
      'toAirportCode': toAirportCode,
      'departureDate': departureDate.toIso8601String(),
      'departureTime': departureTime,
      'departureTerminalName': departureTerminalName,
      'departureGate': departureGate,
      'arrivalDate': arrivalDate.toIso8601String(),
      'arrivalTime': arrivalTime,
      'numberOfSeats': numberOfSeats,
      'cabinTypeName': cabinTypeName,
      'cabinTypeCode': cabinTypeCode,
      'aircraftTypeCode': aircraftTypeCode,
      'aircraftTypeName': aircraftTypeName,
      'bookingClass': bookingClass,
      'flightStatusCode': flightStatusCode,
      'flightStatusName': flightStatusName,
      'durationInMinutes': durationInMinutes,
      'distanceInMiles': distanceInMiles,
      'travelerIndices': travelerIndices,
      'isPast': isPast,
      'isMarriageGroup': isMarriageGroup,
      'source': source,
    };
  }
}

class BDSegment {
  String id;
  String type;
  String text;
  String vendorCode;
  DateTime startDate;
  String startTime;
  String startLocationCode;
  DateTime endDate;
  String endTime;
  String endLocationCode;
  List<BDPassenger> passangers;
  BDFlight flight;

  BDSegment({
    required this.id,
    required this.type,
    required this.text,
    required this.vendorCode,
    required this.startDate,
    required this.startTime,
    required this.startLocationCode,
    required this.endDate,
    required this.endTime,
    required this.endLocationCode,
    required this.passangers,
    required this.flight,
  });

  factory BDSegment.fromJson(Map<String, dynamic> json) => BDSegment(
        id: json["id"],
        type: json["type"],
        text: json["text"],
        vendorCode: json["vendorCode"],
        startDate: DateTime.parse(json["startDate"]),
        startTime: json["startTime"],
        startLocationCode: json["startLocationCode"],
        endDate: DateTime.parse(json["endDate"]),
        endTime: json["endTime"],
        endLocationCode: json["endLocationCode"],
        passangers: List<BDPassenger>.from(
            json["passangers"].map((x) => BDPassenger.fromJson(x))),
        flight: BDFlight.fromJson(json["flight"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "text": text,
        "vendorCode": vendorCode,
        "startDate": startDate.toIso8601String(),
        "startTime": startTime,
        "startLocationCode": startLocationCode,
        "endDate": endDate.toIso8601String(),
        "endTime": endTime,
        "endLocationCode": endLocationCode,
        "passangers": List<dynamic>.from(passangers.map((x) => x.toJson())),
        "flight": flight.toJson(),
      };
}

class BDPassenger {
  String givenName;
  String surname;
  String type;
  String passengerCode;
  String email;
  String phones;
  List<dynamic> specialServices;
  Baggage baggage;
  FareDetail fareDetail;

  BDPassenger({
    required this.givenName,
    required this.surname,
    required this.type,
    required this.passengerCode,
    required this.email,
    required this.phones,
    required this.specialServices,
    required this.baggage,
    required this.fareDetail,
  });

  factory BDPassenger.fromJson(Map<String, dynamic> json) => BDPassenger(
        givenName: json["givenName"],
        surname: json["surname"],
        type: json["type"],
        passengerCode: json["passengerCode"],
        email: json["email"],
        phones: json["phones"],
        specialServices:
            List<dynamic>.from(json["specialServices"].map((x) => x)),
        baggage: Baggage.fromJson(json["baggage"] ?? {}),
        fareDetail: FareDetail.fromJson(json["fareDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "givenName": givenName,
        "surname": surname,
        "type": type,
        "passengerCode": passengerCode,
        "email": email,
        "phones": phones,
        "specialServices": List<dynamic>.from(specialServices.map((x) => x)),
        "baggage": baggage.toJson(),
        "fareDetail": fareDetail.toJson(),
      };
}

class Baggage {
  BaggageAllowance cabinBaggageAllowance;
  BaggageAllowance checkedBaggageAllowance;
  // List<CheckedBaggageCharge>? checkedBaggageCharges;

  Baggage({
    required this.cabinBaggageAllowance,
    required this.checkedBaggageAllowance,
    // required this.checkedBaggageCharges,
  });

  factory Baggage.fromJson(Map<String, dynamic> json) => Baggage(
        cabinBaggageAllowance:
            BaggageAllowance.fromJson(json["cabinBaggageAllowance"] ?? {}),
        checkedBaggageAllowance:
            BaggageAllowance.fromJson(json["checkedBaggageAllowance"] ?? {}),
        //checkedBaggageCharges: List<CheckedBaggageCharge>.from(json["checkedBaggageCharges"] ?? [].map((x) => CheckedBaggageCharge.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "cabinBaggageAllowance": cabinBaggageAllowance.toJson(),
        "checkedBaggageAllowance": checkedBaggageAllowance.toJson(),
        //"checkedBaggageCharges": List<dynamic>.from(checkedBaggageCharges.map((x) => x.toJson())),
      };
}

class BaggageAllowance {
  int maximumPieces;
  int totalWeightInPounds;
  int totalWeightInKilograms;

  BaggageAllowance({
    required this.maximumPieces,
    required this.totalWeightInPounds,
    required this.totalWeightInKilograms,
  });

  factory BaggageAllowance.fromJson(Map<String, dynamic> json) =>
      BaggageAllowance(
        maximumPieces: json["maximumPieces"] ?? 0,
        totalWeightInPounds: json["totalWeightInPounds"] ?? 0,
        totalWeightInKilograms: json["totalWeightInKilograms"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "maximumPieces": maximumPieces,
        "totalWeightInPounds": totalWeightInPounds,
        "totalWeightInKilograms": totalWeightInKilograms,
      };
}

class CheckedBaggageCharge {
  int maximumSizeInInches;
  int maximumSizeInCentimeters;
  int maximumWeightInPounds;
  int maximumWeightInKilograms;
  int numberOfPieces;
  String? specialItemDescription;
  bool isCheckInOnly;
  Penalty fee;

  CheckedBaggageCharge({
    required this.maximumSizeInInches,
    required this.maximumSizeInCentimeters,
    required this.maximumWeightInPounds,
    required this.maximumWeightInKilograms,
    required this.numberOfPieces,
    this.specialItemDescription,
    required this.isCheckInOnly,
    required this.fee,
  });

  factory CheckedBaggageCharge.fromJson(Map<String, dynamic> json) {
    return CheckedBaggageCharge(
      maximumSizeInInches: json['maximumSizeInInches'],
      maximumSizeInCentimeters: json['maximumSizeInCentimeters'],
      maximumWeightInPounds: json['maximumWeightInPounds'],
      maximumWeightInKilograms: json['maximumWeightInKilograms'],
      numberOfPieces: json['numberOfPieces'],
      specialItemDescription: json['specialItemDescription'],
      isCheckInOnly: json['isCheckInOnly'],
      fee: Penalty.fromJson(json['fee']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maximumSizeInInches': maximumSizeInInches,
      'maximumSizeInCentimeters': maximumSizeInCentimeters,
      'maximumWeightInPounds': maximumWeightInPounds,
      'maximumWeightInKilograms': maximumWeightInKilograms,
      'numberOfPieces': numberOfPieces,
      'specialItemDescription': specialItemDescription,
      'isCheckInOnly': isCheckInOnly,
      'fee': fee.toJson(),
    };
  }
}

class FareDetail {
  String fareBasisCode;

  FareDetail({
    required this.fareBasisCode,
  });

  factory FareDetail.fromJson(Map<String, dynamic> json) {
    return FareDetail(
      fareBasisCode: json['fareBasisCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fareBasisCode': fareBasisCode,
    };
  }
}

class TravelersGroup {
  int numberOfTravelers;
  int numberOfTravelersRemaining;

  TravelersGroup({
    required this.numberOfTravelers,
    required this.numberOfTravelersRemaining,
  });

  factory TravelersGroup.fromJson(Map<String, dynamic> json) {
    return TravelersGroup(
      numberOfTravelers: json['numberOfTravelers'],
      numberOfTravelersRemaining: json['numberOfTravelersRemaining'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numberOfTravelers': numberOfTravelers,
      'numberOfTravelersRemaining': numberOfTravelersRemaining,
    };
  }
}
