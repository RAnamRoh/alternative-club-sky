import 'package:data/util/date_time_util.dart';
import 'package:domain/enum/frequent_flyer.dart';
import 'package:domain/enum/passenger_type.dart';
import 'package:domain/enum/sex.dart';
import 'package:domain/model/skyClubModels/booking_contact_details.dart';
import 'package:domain/model/skyClubModels/passenger.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';
//import 'package:sky_club/presentation/util/date_to_string.dart';


class TicketBookingRequest {
  List<PassengerDetail> passengerDetails;
  List<Journey> journeys;
  Fare fare;
  Contact contact;

  TicketBookingRequest({
    required this.passengerDetails,
    required this.journeys,
    required this.fare,
    required this.contact,
  });

  // Convert TicketBookingRequest to JSON
  Map<String, dynamic> toJson() {
    return {
      "passengerDetails": passengerDetails.map((p) => p.toJson()).toList(),
      "journeys": journeys.map((j) => j.toJson()).toList(),
      "fare": fare.toJson(),
      "contact": contact.toJson(),
    };
  }

  // Create TicketBookingRequest from JSON
  factory TicketBookingRequest.fromJson(Map<String, dynamic> json) {
    return TicketBookingRequest(
      passengerDetails: (json["passengerDetails"] as List)
          .map((p) => PassengerDetail.fromJson(p))
          .toList(),
      journeys: (json["journeys"] as List)
          .map((j) => Journey.fromJson(j))
          .toList(),
      fare: Fare.fromJson(json["fare"]),
      contact: Contact.fromJson(json["contact"]),
    );
  }

  static TicketBookingRequest createTicketBookingRequest({
    required List<PassengerDomain> passengerList,
    required BookingContactDetails bookingDetails,
    required SearchedFlightDomain searchedFlight,
    required bool hasSMS,
     String paymentMethod = 'stripe',
  }) {
    // Map passenger details
    final passengerDetails = passengerList.map((passenger) {
      return PassengerDetail(
        passengerType: passenger.type.code, // Use the code from PassengerTypeExtension
        givenName: passenger.firstName ?? "",
        surname: passenger.lastName ?? "",
        dateOfBirth: passenger.dateOfBirth ?? DateTime.now() , // Provide a default value if null
        infant: passenger.type == PassengerType.infant,
        gender: passenger.sex?.code ?? "M", // Use the code from SexExtension, default to "M" if null
        locationCode: "",
        phone: "",
        email: "",
        passport: Passport(
          passportNo: passenger.passportNumber ?? "",
          expireDate: passenger.passportExpiryDate?.toIso8601String() ?? "",
          issueCountry: passenger.issuingCountry?.name ?? "-",
        ),
        frequentFlyer: FrequentFlyer(
          program: passenger.frequentFlyer?.code ?? "",
          membershipId: passenger.membershipNumber ?? "",
        ),
        specialServices: passenger.specialAssistance != null
            ? [
          SpecialService(
            code: passenger.specialAssistance!.name,
            text: null,
          ),
        ]
            : [],
      );
    }).toList();

    // Map journeys
    final journeys = searchedFlight.journeys.map((journey) {
      return Journey(
        departureDateTime: journey.departureTime,
        originCode: journey.originCode,
        destinationCode: journey.destinationCode,
        segments: journey.segments.map((segment) {
          return Segment(
            flightNumber: segment.airline.flightNumber ?? "",
            originCode: segment.originCode,
            departureDate: segment.departureTime,
            destinationCode: segment.destinationCode,
            arrivalDate: segment.arrivalTime,
            operatorCode: segment.operatorCode,
            marketingCode: segment.marketingCode,
            vehicleType: segment.vehicleType,
            bookingClassCode: segment.bookingClassCode,
            fareRef: segment.fareRef, // Default value, adjust as needed
          );
        }).toList(),
      );
    }).toList();

    // Map fare
    final fare = Fare(
      hasSmsService: hasSMS, // TODO : Take From Request
      orginalTotal: searchedFlight.totalPrice.toInt(),
      paymentMethod: paymentMethod,
      membershipId: null,
      redeemPoint: 0,
    );

    // Map contact details
    final contact = Contact(
      firstName: bookingDetails.firstName,
      lastName: bookingDetails.lastName,
      email: bookingDetails.email,
      phone: bookingDetails.phoneNo,
      address: "dhaka", // Default value, adjust as needed
    );

    return TicketBookingRequest(
      passengerDetails: passengerDetails,
      journeys: journeys,
      fare: fare,
      contact: contact,
    );
  }


}

class Contact {
  String firstName;
  String lastName;
  String email;
  String phone;
  String address;

  Contact({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
  });

  // Convert Contact to JSON
  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "address": address,
    };
  }

  // Create Contact from JSON
  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
    );
  }
}

class Fare {
  bool hasSmsService;
  int orginalTotal;
  String paymentMethod;
  dynamic membershipId;
  int redeemPoint;

  Fare({
    required this.hasSmsService,
    required this.orginalTotal,
    required this.paymentMethod,
    required this.membershipId,
    required this.redeemPoint,
  });

  // Convert Fare to JSON
  Map<String, dynamic> toJson() {
    return {
      "hasSMSService": hasSmsService,
      "orginalTotal": orginalTotal,
      "paymentMethod": paymentMethod,
      "membershipId": membershipId,
      "redeemPoint": redeemPoint,
    };
  }

  // Create Fare from JSON
  factory Fare.fromJson(Map<String, dynamic> json) {
    return Fare(
      hasSmsService: json["hasSMSService"],
      orginalTotal: json["orginalTotal"],
      paymentMethod: json["paymentMethod"],
      membershipId: json["membershipId"],
      redeemPoint: json["redeemPoint"],
    );
  }
}

class Journey {
  DateTime departureDateTime;
  String originCode;
  String destinationCode;
  List<Segment> segments;

  Journey({
    required this.departureDateTime,
    required this.originCode,
    required this.destinationCode,
    required this.segments,
  });

  // Convert Journey to JSON
  Map<String, dynamic> toJson() {
    return {
      "departureDateTime": DateTimeUtils.formatToIso8601(departureDateTime),
      "originCode": originCode,
      "destinationCode": destinationCode,
      "segments": segments.map((s) => s.toJson()).toList(),
    };
  }

  // Create Journey from JSON
  factory Journey.fromJson(Map<String, dynamic> json) {
    return Journey(
      departureDateTime: DateTime.parse(json["departureDateTime"]),
      originCode: json["originCode"],
      destinationCode: json["destinationCode"],
      segments: (json["segments"] as List)
          .map((s) => Segment.fromJson(s))
          .toList(),
    );
  }
}

class Segment {
  String flightNumber;
  String originCode;
  DateTime departureDate;
  String destinationCode;
  DateTime arrivalDate;
  String operatorCode;
  String marketingCode;
  String vehicleType;
  String bookingClassCode;
  int fareRef;

  Segment({
    required this.flightNumber,
    required this.originCode,
    required this.departureDate,
    required this.destinationCode,
    required this.arrivalDate,
    required this.operatorCode,
    required this.marketingCode,
    required this.vehicleType,
    required this.bookingClassCode,
    required this.fareRef,
  });

  // Convert Segment to JSON
  Map<String, dynamic> toJson() {
    return {
      "flightNumber": flightNumber,
      "originCode": originCode,
      "departureDate": DateTimeUtils.formatToIso8601(departureDate),
      "destinationCode": destinationCode,
      "arrivalDate": DateTimeUtils.formatToIso8601(arrivalDate),
      "operatorCode": operatorCode,
      "marketingCode": marketingCode,
      "vehicleType": vehicleType,
      "bookingClassCode": bookingClassCode,
      "fareRef": fareRef,
    };
  }

  // Create Segment from JSON
  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      flightNumber: json["flightNumber"],
      originCode: json["originCode"],
      departureDate: DateTime.parse(json["departureDate"]),
      destinationCode: json["destinationCode"],
      arrivalDate: DateTime.parse(json["arrivalDate"]),
      operatorCode: json["operatorCode"],
      marketingCode: json["marketingCode"],
      vehicleType: json["vehicleType"],
      bookingClassCode: json["bookingClassCode"],
      fareRef: json["fareRef"],
    );
  }
}

class PassengerDetail {
  String passengerType;
  String givenName;
  String surname;
  DateTime dateOfBirth;
  bool infant;
  String gender;
  String locationCode;
  String phone;
  String email;
  Passport passport;
  FrequentFlyer frequentFlyer;
  List<SpecialService> specialServices;

  PassengerDetail({
    required this.passengerType,
    required this.givenName,
    required this.surname,
    required this.dateOfBirth,
    required this.infant,
    required this.gender,
    required this.locationCode,
    required this.phone,
    required this.email,
    required this.passport,
    required this.frequentFlyer,
    required this.specialServices,
  });

  // Convert PassengerDetail to JSON
  Map<String, dynamic> toJson() {
    return {
      "passengerType": passengerType,
      "givenName": givenName,
      "surname": surname,
      "dateOfBirth": DateTimeUtils.formatDateForDOB(dateOfBirth),
      "infant": infant,
      "gender": gender,
      "locationCode": locationCode,
      "phone": phone,
      "email": email,
      "passport": passport.toJson(),
      "frequentFlyer": frequentFlyer.toJson(),
      "specialServices": specialServices.map((s) => s.toJson()).toList(),
    };
  }

  // Create PassengerDetail from JSON
  factory PassengerDetail.fromJson(Map<String, dynamic> json) {
    return PassengerDetail(
      passengerType: json["passengerType"],
      givenName: json["givenName"],
      surname: json["surname"],
      dateOfBirth: DateTime.parse(json["dateOfBirth"]),
      infant: json["infant"],
      gender: json["gender"],
      locationCode: json["locationCode"],
      phone: json["phone"],
      email: json["email"],
      passport: Passport.fromJson(json["passport"]),
      frequentFlyer: FrequentFlyer.fromJson(json["frequentFlyer"]),
      specialServices: (json["specialServices"] as List)
          .map((s) => SpecialService.fromJson(s))
          .toList(),
    );
  }
}

class FrequentFlyer {
  String program;
  String membershipId;

  FrequentFlyer({
    required this.program,
    required this.membershipId,
  });

  // Convert FrequentFlyer to JSON
  Map<String, dynamic> toJson() {
    return {
      "program": program,
      "membershipId": membershipId,
    };
  }

  // Create FrequentFlyer from JSON
  factory FrequentFlyer.fromJson(Map<String, dynamic> json) {
    return FrequentFlyer(
      program: json["program"],
      membershipId: json["membershipId"],
    );
  }
}

class Passport {
  String passportNo;
  String expireDate;
  String issueCountry;

  Passport({
    required this.passportNo,
    required this.expireDate,
    required this.issueCountry,
  });

  // Convert Passport to JSON
  Map<String, dynamic> toJson() {
    return {
      "passportNo": passportNo,
      "expireDate": expireDate,
      "issueCountry": issueCountry,
    };
  }

  // Create Passport from JSON
  factory Passport.fromJson(Map<String, dynamic> json) {
    return Passport(
      passportNo: json["passportNo"],
      expireDate: json["expireDate"],
      issueCountry: json["issueCountry"],
    );
  }
}

class SpecialService {
  String code;
  dynamic text;

  SpecialService({
    required this.code,
    required this.text,
  });

  // Convert SpecialService to JSON
  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "text": text,
    };
  }

  // Create SpecialService from JSON
  factory SpecialService.fromJson(Map<String, dynamic> json) {
    return SpecialService(
      code: json["code"],
      text: json["text"],
    );
  }
}