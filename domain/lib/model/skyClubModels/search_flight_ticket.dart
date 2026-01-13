
import 'package:domain/enum/seat_class.dart';
import 'package:domain/model/skyClubModels/airline.dart';
import 'package:domain/model/skyClubModels/airport.dart';
import 'package:intl/intl.dart';

class SearchFlightTicket {

  final String flightNumber;
  final AirlineDomain airline;
  final Airport origin;
  final Airport destination;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final SeatClass seatClass; // Economy, Business, First
  final String bookingReference;
  final double price;
  final String? layover;
  final Airport? layoverAirport;
  final DateTime? layoverDepartureTime;
  final DateTime? layoverArrivalTime;
  final bool isRoundTrip; // true if round-trip, false otherwise
  final String? returnFlightNumber; // For round-trip flights
  final DateTime? returnDepartureTime; // For round-trip flights
  final DateTime? returnArrivalTime; // For round-trip flights

  SearchFlightTicket({
    required this.flightNumber,
    required this.airline,
    required this.origin,
    required this.destination,
    required this.departureTime,
    required this.arrivalTime,
    required this.seatClass,
    required this.bookingReference,
    required this.price,
    this.layover,
    this.layoverAirport,
    this.layoverDepartureTime,
    this.layoverArrivalTime,
    this.isRoundTrip = false,
    this.returnFlightNumber,
    this.returnDepartureTime,
    this.returnArrivalTime,
  });

  // Helper to format date/time strings


  String getFormattedDepartureDate() {
    // Using DateFormat to get the format 'Sun 23 Jun'
    return DateFormat('E dd MMM').format(departureTime);
  }

  String getFormattedDepartureTime() {
    // Using DateFormat to get the format '1:15pm'
    return DateFormat('h:mma').format(departureTime).toLowerCase(); // Converts am/pm to lowercase
  }

  String getFormattedArrivalDate() {
    // Using DateFormat to get the format 'Sun 23 Jun'
    return DateFormat('E dd MMM').format(arrivalTime);
  }

  String getFormattedArrivalTime() {
    // Using DateFormat to get the format '1:15pm'
    return DateFormat('h:mma').format(arrivalTime).toLowerCase(); // Converts am/pm to lowercase
  }



  // Method to calculate flight time
  String getFlightTime() {
    // Calculate the difference in hours and minutes between departure and arrival
    final duration = arrivalTime.difference(departureTime);

    // Extract hours and minutes from the duration
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    // Return the formatted string
    return '${hours}h ${minutes}m';
  }

  static List<SearchFlightTicket> dummyFlightTickets = [
    SearchFlightTicket(
      flightNumber: "AI-123",
      airline: AirlineDomain(name: 'Qatar Airways', code: 'QA', logo_url: 'assets/images/qatar_airways_logo.png', flightNumber: 'AI-123'),
      origin: const Airport(
        name: "Sydney Airport",
        city: "Sydney",
        country: "Australia",
        code: "SYD",
      ),
      destination: const Airport(
        name: "Melbourne Airport",
        city: "Melbourne",
        country: "Australia",
        code: "MEL",
      ),
      departureTime: DateTime.now(),
      arrivalTime: DateTime.now().add(const Duration(hours: 2)),
      seatClass: SeatClass.economy,
      bookingReference: "ABC123",
      price: 1000,
    ),
    SearchFlightTicket(
      flightNumber: "AI-456",
      airline: AirlineDomain(name: 'Turkish Airlines', code: 'TK', logo_url: 'assets/images/turkish_airways_logo.png', flightNumber: 'AI-456'),
      origin: const Airport(
        name: "Sydney Airport",
        city: "Sydney",
        country: "Australia",
        code: "SYD",
      ),
      destination: const Airport(
        name: "Zia International Airport",
        city: "Dhaka",
        country: "Bangladesh",
        code: "DAC",
      ),
      departureTime: DateTime.now().add(const Duration(days: 1)),
      arrivalTime: DateTime.now().add(const Duration(days: 1, hours: 2)),
      seatClass: SeatClass.economy,
      bookingReference: "DEF456",
      price: 1500,
    ),
    SearchFlightTicket(
      flightNumber: "AI-789",
      airline: AirlineDomain(name: 'Singapore Airlines', code: 'SA', logo_url: 'assets/images/singapore_airlines_logo.png', flightNumber: 'AI-789'),
      origin: const Airport(
        name: "Zia International Airport",
        city: "Dhaka",
        country: "Bangladesh",
        code: "DAC",
      ),
      destination: const Airport(
        name: "John F Kennedy Airport",
        city: "New York",
        country: "United States",
        code: "JFK",
      ),
      departureTime: DateTime.now().add(const Duration(days: 2)),
      arrivalTime: DateTime.now().add(const Duration(days: 2, hours: 2)),
      seatClass: SeatClass.economy,
      bookingReference: "GHI789",
      price: 2000,
      layover: "1h 50m",
      layoverAirport: const Airport(
        name: "Hamad International Airport",
        city: "Doha",
        country: "Qatar",
        code: "DOH",
      ),
      layoverDepartureTime: DateTime.now().add(const Duration(days: 2, hours: 3)),
      layoverArrivalTime: DateTime.now().add(const Duration(days: 2, hours: 5)),
    ),
  ];


  static SearchFlightTicket exampleTicket = SearchFlightTicket(
    flightNumber: "AI-789",
    airline: AirlineDomain(name: 'Singapore Airlines', code: 'SA', logo_url: 'assets/images/singapore_airlines_logo.png', flightNumber: 'AI-789'),
    origin: const Airport(
      name: "Zia International Airport",
      city: "Dhaka",
      country: "Bangladesh",
      code: "DAC",
    ),
    destination: const Airport(
      name: "John F Kennedy Airport",
      city: "New York",
      country: "United States",
      code: "JFK",
    ),
    departureTime: DateTime.now().add(const Duration(days: 2)),
    arrivalTime: DateTime.now().add(const Duration(days: 2, hours: 2)),
    seatClass: SeatClass.economy,
    bookingReference: "GHI789",
    price: 2000,
    layover: "1h 50m",
    layoverAirport: const Airport(
      name: "Hamad International Airport",
      city: "Doha",
      country: "Qatar",
      code: "DOH",
    ),
    layoverDepartureTime: DateTime.now().add(const Duration(days: 2, hours: 3)),
    layoverArrivalTime: DateTime.now().add(const Duration(days: 2, hours: 5)),
  );

}
