

import 'package:domain/model/skyClubModels/booking_contact_details.dart';
import 'package:domain/model/skyClubModels/passenger.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';
import 'package:data/remote/response/booking/sms_fee_response.dart';

abstract class BookFormRepository {

  Future<String> bookTicket({
    required List<PassengerDomain> passengerList,
    required SearchedFlightDomain searchedFlight,
    required BookingContactDetails bookingDetails,
    required bool hasSMS,
  });

  Future<SmsFeeResponse> getSmsFee();

  Future<String> makePayment({required String bookingId});



}