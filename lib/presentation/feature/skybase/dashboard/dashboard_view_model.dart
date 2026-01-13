
import 'package:domain/model/skyClubModels/booking.dart';
import 'package:domain/model/skyClubModels/booking_list_and_stats.dart';
import 'package:domain/model/skyClubModels/booking_stats.dart';
import 'package:domain/repository/booking_details_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/feature/bookingdetails/route/bookingdetails_argument.dart';
import 'package:sky_club/presentation/feature/bookingdetails/route/bookingdetails_route.dart';
import 'package:sky_club/presentation/feature/skybase/dashboard/route/dashboard_argument.dart';
import 'package:sky_club/presentation/util/value_notifier_list.dart';

class DashboardViewModel extends BaseViewModel<DashboardArgument> {


  ValueNotifierList<Booking> myBookings = ValueNotifierList([]);
  ValueNotifier<BookingStats?> myBookingsStats = ValueNotifier<BookingStats?>(null);


  final BookingDetailsRepository bookingRepository;

  DashboardViewModel({required this.bookingRepository});

  @override
  void onViewReady({DashboardArgument? argument}) {
    super.onViewReady();
    getMyBookings();
  }



  void ticketClicked({required String bookingId}) {
    navigateToScreen(destination: BookingdetailsRoute(arguments: BookingdetailsArgument(bookingId: bookingId)));
  }


  Future<void> getMyBookings() async {


      final BookingListAndStats response = await loadData(() => bookingRepository.getMyBookings(),);

      myBookings.value = response.bookingList;
      myBookingsStats.value = response.bookingStats;


  }



}
