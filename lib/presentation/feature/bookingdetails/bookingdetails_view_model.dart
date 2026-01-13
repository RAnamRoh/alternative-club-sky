import 'package:domain/enum/redirect_page.dart';
import 'package:domain/model/skyClubModels/baggage_fare_model.dart';
import 'package:domain/model/skyClubModels/bookedFlightInfo.dart';
import 'package:domain/model/skyClubModels/booking_detail_content.dart';
import 'package:domain/model/skyClubModels/fare_rules_model.dart';
import 'package:domain/model/skyClubModels/passenger_info_model.dart';
import 'package:domain/model/skyClubModels/travel_itinerary_model.dart';
import 'package:domain/repository/booking_details_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/feature/bookingdetails/route/bookingdetails_argument.dart';
import 'package:sky_club/presentation/feature/cancel_booking/route/cancel_booking_argument.dart';
import 'package:sky_club/presentation/feature/cancel_booking/route/cancel_booking_route.dart';
import 'package:sky_club/presentation/feature/payment_web_view/route/payment_web_view_argument.dart';
import 'package:sky_club/presentation/feature/payment_web_view/route/payment_web_view_route.dart';
import 'package:sky_club/presentation/localization/ui_text.dart';
import 'package:sky_club/presentation/util/value_notifier_list.dart';

class BookingdetailsViewModel extends BaseViewModel<BookingdetailsArgument> {
  final BookingDetailsRepository repository;

  ValueNotifierList<PassengerInfoModel> passengerInfoList = ValueNotifierList([]);

  ValueNotifierList<BaggageFareModel> baggageFareList = ValueNotifierList([]);

  ValueNotifierList<FareRulesModel> fareRulesList = ValueNotifierList([]);

  ValueNotifierList<TravelItineraryModel> travelItineraryList = ValueNotifierList([]);

  ValueNotifier<String> bookingStatus = ValueNotifier('');
  ValueNotifier<BookedFlightInfo> flightInfo = ValueNotifier(BookedFlightInfo());

  late String bookingId;

  BookingdetailsViewModel({required this.repository}) ;

  @override
  void onDispose() {

    super.onDispose();
    passengerInfoList.dispose();
    baggageFareList.dispose();
    fareRulesList.dispose();
    travelItineraryList.dispose();
  }

  @override
  void onViewReady({BookingdetailsArgument? argument}) {
    super.onViewReady();
    getBookingById(argument!.bookingId);
    bookingId = argument.bookingId;
  }



  Future<void> getBookingById(String bookingId) async {
   final BookingDetailContent response = await loadData(() => repository.getBookingById(bookingId: bookingId));
    passengerInfoList.value = response.passengerInfoList;
    baggageFareList.value = response.baggageFareList;
    fareRulesList.value = response.fareRulesList;
    travelItineraryList.value = response.travelItineraryList;
    bookingStatus.value = response.bookingStatus;
    flightInfo.value = response.flightInfo;
  }

  void onCancelClicked(){
    navigateToScreen(destination: CancelBookingRoute(arguments: CancelBookingArgument(bookingId: bookingId, flightInfo: flightInfo.value)));
  }


  Future<void> makePayment() async {

    final String response = await loadData(() => repository.makePayment(bookingId: bookingId));

    if(response.isNotEmpty){
      navigateToScreen(destination: PaymentWebViewRoute(arguments: PaymentWebViewArgument(checkoutUrl: response, redirectUrl: RedirectPage.paymentSuccess)));

    }else{
      showToast(uiText: FixedUiText(text: 'Something went wrong'));
    }



  }


}
