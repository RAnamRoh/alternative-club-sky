class UserBookingsResponse {
  String pnr;
  String bookingId;
  String startDate;
  String endDate;
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
  String timestamp;
  int total;
  List<dynamic> flights;
  List<dynamic> segments;
  List<BookingJourneyResponse> journeys;

  UserBookingsResponse({
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
    required this.flights,
    required this.segments,
    required this.journeys,
  });

  // From JSON
  factory UserBookingsResponse.fromJson(Map<String, dynamic> json) {
    return UserBookingsResponse(
      pnr: json['pnr'],
      bookingId: json['bookingId'],
      startDate: json['startDate'],
      endDate: json['endDate'],
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
      timestamp: json['timestamp'],
      total: json['total'],
      flights: json['flights'] ?? [],
      segments: json['segments'] ?? [],
      journeys: (json['journeys'] as List)
          .map((e) => BookingJourneyResponse.fromJson(e))
          .toList(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'pnr': pnr,
      'bookingId': bookingId,
      'startDate': startDate,
      'endDate': endDate,
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
      'timestamp': timestamp,
      'total': total,
      'flights': flights,
      'segments': segments,
      'journeys': journeys.map((e) => e.toJson()).toList(),
    };
  }
}

class BookingJourneyResponse {
  String firstAirportCode;
  String departureDate;
  String departureTime;
  String arrivalDate;
  String arrivalTime;
  String lastAirportCode;
  int numberOfFlights;
  String firstCityName;
  String lastCityName;

  BookingJourneyResponse({
    required this.firstAirportCode,
    required this.departureDate,
    required this.departureTime,
    required this.arrivalDate,
    required this.arrivalTime,
    required this.lastAirportCode,
    required this.numberOfFlights,
    required this.firstCityName,
    required this.lastCityName,
  });

  // From JSON
  factory BookingJourneyResponse.fromJson(Map<String, dynamic> json) {
    return BookingJourneyResponse(
      firstAirportCode: json['firstAirportCode'],
      departureDate: json['departureDate'],
      departureTime: json['departureTime'],
      arrivalDate: json['arrivalDate'],
      arrivalTime: json['arrivalTime'],
      lastAirportCode: json['lastAirportCode'],
      numberOfFlights: json['numberOfFlights'],
      firstCityName: json['firstCityName'],
      lastCityName: json['lastCityName'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'firstAirportCode': firstAirportCode,
      'departureDate': departureDate,
      'departureTime': departureTime,
      'arrivalDate': arrivalDate,
      'arrivalTime': arrivalTime,
      'lastAirportCode': lastAirportCode,
      'numberOfFlights': numberOfFlights,
      'firstCityName': firstCityName,
      'lastCityName': lastCityName,
    };
  }
}
