import 'package:domain/model/skyClubModels/search_flight_details.dart';
import 'package:sky_club/presentation/base/base_argument.dart';

class SearchticketArgument extends BaseArgument {
  // int id;
  // String name;
  //
  // HelloWorldArgument({required this.id, required this.name});

  final SearchFlightDetails flightDetails;

  SearchticketArgument(this.flightDetails);
}
