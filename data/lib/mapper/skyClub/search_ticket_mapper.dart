import 'package:data/remote/response/ticket/flight_response.dart';
import 'package:data/util/date_time_util.dart';
import 'package:domain/enum/journey_direction.dart';
import 'package:domain/enum/seat_class.dart';
import 'package:domain/model/skyClubModels/airline.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';

class SearchTicketMapper {
  /// Maps an [FlightResponse] object to an [SearchedFlightDomain] domain model.

  static List<SearchedFlightDomain> fromFlightResponseList(
      FlightResponse response) {
    return response.flights
        .map((flight) => fromFlightResponse(flight))
        .toList();
  }

  static SearchedFlightDomain fromFlightResponse(Flight flight) {
    final SearchedFlightDomain searchedFlightDomain = SearchedFlightDomain(
      id: flight.id,
      departureTime: DateTimeUtils.applyOffsetToDateTime(
              flight.departureDate, flight.departureDateTimeOffset) ??
          flight.departureDate,
      arrivalTime: DateTimeUtils.applyOffsetToDateTime(
              flight.journeys.first.arrivalDateTime,
              flight.journeys.first.arrivalDateTimeOffset) ??
          flight.departureDate,
      originCode: flight.journeys.first.originCode,
      destinationCode: flight.journeys.first.destinationCode,
      pricePerPerson: flight.passengerTotalFare.first.totalFare,
      pricePerChild: flight.passengerTotalFare.length > 1
          ? flight.passengerTotalFare[1].totalFare : null,
      pricePerInfant: flight.passengerTotalFare.length > 2 ? flight.passengerTotalFare[2].totalFare : null,
      totalPrice: flight.totalFare.totalPrice,
      journeys: flight.journeys
          .map((journey) => fromJourneyResponse(journey))
          .toList(),
      isRoundTrip: flight.isRoundTrip,
    );

    return searchedFlightDomain;
  }

  static JourneyDomain fromJourneyResponse(Journey journey) {
    final JourneyDomain journeyDomain = JourneyDomain(
        journeyDirection:
            JourneyDirectionExtension.getJourneyDirectionFromString(
                journey.direction),
        departureTime: DateTimeUtils.applyOffsetToDateTime(
                journey.departureDateTime, journey.departureDateTimeOffset) ??
            journey.departureDateTime,
        arrivalTime: DateTimeUtils.applyOffsetToDateTime(
                journey.arrivalDateTime, journey.arrivalDateTimeOffset) ??
            journey.arrivalDateTime,
        originCode: journey.originCode,
        destinationCode: journey.destinationCode,
        segments: journey.segments
            .map((segments) => fromSegmentResponse(segments))
            .toList());

    return journeyDomain;
  }

  static SegmentDomain fromSegmentResponse(Segment segment) {
    final SegmentDomain segmentDomain = SegmentDomain(
        aircraftName: segment.aircraftName,
        departureTime: DateTimeUtils.applyOffsetToDateTime(
                segment.departureDate, segment.departureDateTimeOffset) ??
            segment.departureDate,
        arrivalTime: DateTimeUtils.applyOffsetToDateTime(
                segment.arrivalDate, segment.arrivalDateTimeOffset) ??
            segment.arrivalDate,
        airline: AirlineDomain(
            name: segment.marketing.airlineName,
            code: segment.marketing.airlineCode,
            logo_url: segment.marketing.airlineLogo,
            flightNumber: segment.marketing.flightNumber),
        originCode: segment.originCode,
        destinationCode: segment.destinationCode,
        baggageQuantityAllowance: segment.baggages.isNotEmpty
            ? segment.baggages.first.includedBaggageWeight
            : 0,
        flightDuration: segment.durationMinutes,
        seatClass: SeatClassExtension.getSeatClassFromString(
            segment.passengerSegmentUtils.first.cabinClassName),
        aircraftLogoUrl: segment.marketing.airlineLogo,
        operatorCode: segment.operatorCode,
        marketingCode: segment.marketingCode,
        vehicleType: segment.vehicleType,
        bookingClassCode: segment.passengerSegmentUtils.first.bookingClassCode,
        fareRef: segment.fareRef);

    return segmentDomain;
  }

  static AirlineDomain fromAirlineResponse(Airline airline) {
    final AirlineDomain airlineDomain = AirlineDomain(
        name: airline.name,
        code: airline.code,
        logo_url: airline.logo,
        flightNumber: '');
    return airlineDomain;
  }

  static List<AirlineDomain> fromAirlineResponseList(List<Airline> airlines) {
    return airlines.map((airline) => fromAirlineResponse(airline)).toList();
  }
}
