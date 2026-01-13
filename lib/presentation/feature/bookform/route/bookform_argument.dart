import 'package:domain/model/skyClubModels/search_flight_details.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';
import 'package:sky_club/presentation/base/base_argument.dart';

class BookformArgument extends BaseArgument {
  // int id;
  // String name;
  //
  // HelloWorldArgument({required this.id, required this.name});

  final SearchFlightDetails flightDetails;
  final SearchedFlightDomain selectedFlight;

  BookformArgument({required this.flightDetails, required this.selectedFlight});
}
