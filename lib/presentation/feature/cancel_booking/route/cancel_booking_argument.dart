import 'package:domain/model/skyClubModels/bookedFlightInfo.dart';
import 'package:club_alt/presentation/base/base_argument.dart';

class CancelBookingArgument extends BaseArgument {
  // int id;
  // String name;
  //
  // HelloWorldArgument({required this.id, required this.name});

  String bookingId;
  BookedFlightInfo flightInfo;
  CancelBookingArgument({required this.bookingId, required this.flightInfo});


}
