import 'package:domain/model/skyClubModels/bookedFlightInfo.dart';
import 'package:flutter/foundation.dart';
import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/feature/bookingdetails/page/ticket_cancel/route/ticket_cancel_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_route.dart';

class TicketCancelViewModel extends BaseViewModel<TicketCancelArgument> {
  ValueNotifier<BookedFlightInfo> flightInfo = ValueNotifier(BookedFlightInfo());

  TicketCancelViewModel();

  @override
  void onViewReady({TicketCancelArgument? argument}) {
    super.onViewReady();
    if (argument != null) {
      flightInfo.value = argument.flightInfo;
    }
  }

  void navigateToHome() {
    navigateToScreen(destination: SkybaseRoute(arguments: SkybaseArgument()), isClearBackStack: true);
  }


}
