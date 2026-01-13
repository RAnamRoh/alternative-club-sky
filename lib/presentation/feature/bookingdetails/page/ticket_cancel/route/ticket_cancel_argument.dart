import 'package:domain/model/skyClubModels/bookedFlightInfo.dart';
import 'package:club_alt/presentation/base/base_argument.dart';

class TicketCancelArgument extends BaseArgument {
  // int id;
  // String name;
  //
  // HelloWorldArgument({required this.id, required this.name});

  BookedFlightInfo flightInfo;
  TicketCancelArgument({required this.flightInfo});
}
