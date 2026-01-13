import 'package:data/remote/response/booking/booking_detail_response.dart';
import 'package:domain/model/skyClubModels/travel_itinerary_model.dart';
import 'package:intl/intl.dart';

class BKTravelItineraryMapper{

  static DateTime combineDateAndTime(DateTime date, String time) {
    // Ensure the time string is in the correct format
    DateTime parsedTime = DateFormat("HH:mm:ss").parse(time);

    // Combine date and time into a new DateTime object
    return DateTime(
      date.year,
      date.month,
      date.day,
      parsedTime.hour,
      parsedTime.minute,
      parsedTime.second,
    );
  }

  static TravelItineraryModel mapToTravelItineraryModel(BDFlight flight){

    String flightNumber = flight.aircraftTypeCode;
    String checkIn = '';
    String from = flight.fromAirportCode;
    String to = flight.toAirportCode;
    DateTime departureDate = combineDateAndTime(flight.departureDate, flight.departureTime);
    DateTime arrivalDate = combineDateAndTime( flight.arrivalDate, flight.arrivalTime);
    String terminal = flight.departureTerminalName;
    String cabin = flight.cabinTypeName;
    String status = flight.flightStatusName;
    String fleetInfo = flight.aircraftTypeName;



   final model = TravelItineraryModel(
        flightNumber: flightNumber,
        checkIn: checkIn,
        from: from,
        to: to,
        departureDate: departureDate,
        arrivalDate: arrivalDate,
        terminal: terminal,
        cabin: cabin,
        status: status,
        fleetInfo: fleetInfo
    );

   return model;

  }


  static List<TravelItineraryModel> mapToTravelItineraryModels(List<BDFlight> flights){
    return flights.map((flight) => mapToTravelItineraryModel(flight)).toList();
  }



}