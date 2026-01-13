import 'package:domain/enum/journey_direction.dart';
import 'package:domain/enum/seat_class.dart';
import 'package:domain/model/skyClubModels/airline.dart';
import 'package:intl/intl.dart';

class SearchedFlightDomain {
  final int id;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final String originCode;
  final String destinationCode;
  final double pricePerPerson;
  double? pricePerChild;
  double? pricePerInfant;
  final double totalPrice;
  final List<JourneyDomain> journeys;
  final bool isRoundTrip;
  int get stops => journeys.first.segments.length - 1;

  SearchedFlightDomain({
    required this.id,
    required this.departureTime,
    required this.arrivalTime,
    required this.originCode,
    required this.destinationCode,
    required this.pricePerPerson,
    this.pricePerChild,
    this.pricePerInfant,
    required this.totalPrice,
    required this.journeys,
    required this.isRoundTrip,
  });



  String getFormattedDate(DateTime departureTime) {
    // Using DateFormat to get the format 'Sun 23 Jun'
    return DateFormat('E dd MMM').format(departureTime);
  }

  String getFormattedTime(DateTime departureTime) {
    // Using DateFormat to get the format '1:15pm'
    return DateFormat('h:mma')
        .format(departureTime)
        .toLowerCase(); // Converts am/pm to lowercase
  }

  // Method to calculate flight time
  String getFlightTime(DateTime departureTime, DateTime arrivalTime) {
    // Ensure both times are in UTC to avoid timezone complications
    final depUtc = departureTime.toUtc();
    final arrUtc = arrivalTime.toUtc();

    // Calculate the difference
    final duration = arrUtc.difference(depUtc);

    // Get absolute values for total minutes
    final totalMinutes = duration.inMinutes.abs();

    // Calculate hours and minutes
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    return '${hours}h ${minutes}m';
  }

  static String getFlightDuration(int durationMinutes) {
    final int hours = durationMinutes ~/ 60; // Calculate hours
    final int minutes = durationMinutes % 60; // Calculate remaining minutes
    return '${hours}h ${minutes}m';
  }

  static int getTotalFlightDurationInMinutes(List<SegmentDomain> segments) {
    return segments.fold(0, (sum, segment) => sum + segment.flightDuration);
  }
}

class JourneyDomain {
  final JourneyDirection journeyDirection;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final String originCode;
  final String destinationCode;
  final List<SegmentDomain> segments;
  int get stops => segments.length - 1;
  String get aircraftLogoUrl => segments.length > 1 ? segments.first.aircraftLogoUrl : segments.last.aircraftLogoUrl;

  JourneyDomain({
    required this.journeyDirection,
    required this.departureTime,
    required this.arrivalTime,
    required this.originCode,
    required this.destinationCode,
    required this.segments,
  });
}

class SegmentDomain {
  final String aircraftName;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final AirlineDomain airline;
  final String originCode;
  final String destinationCode;
  final int baggageQuantityAllowance;
  final int flightDuration;
  final SeatClass seatClass;
  final String aircraftLogoUrl;
  final String operatorCode;
  final String marketingCode;
  final String vehicleType;
  final String bookingClassCode;
  final int fareRef;

  SegmentDomain(
      {required this.aircraftName,
      required this.departureTime,
      required this.arrivalTime,
      required this.airline,
      required this.originCode,
      required this.destinationCode,
      required this.baggageQuantityAllowance,
      required this.flightDuration,
      required this.seatClass,
      required this.aircraftLogoUrl,
      required this.operatorCode,
      required this.marketingCode,
      required this.vehicleType,
      required this.bookingClassCode,
      required this.fareRef
      });

}
