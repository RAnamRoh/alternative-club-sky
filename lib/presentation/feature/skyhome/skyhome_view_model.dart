import 'package:data/sessionManager/user_session_manager.dart';
import 'package:domain/enum/seat_class.dart';
import 'package:domain/enum/travel_way.dart';
import 'package:domain/model/skyClubModels/airport.dart';
import 'package:domain/model/skyClubModels/multi_city_journey.dart';
import 'package:domain/model/skyClubModels/search_flight_details.dart';
import 'package:domain/model/skyClubModels/sky_user.dart';
import 'package:domain/repository/sky_home_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/feature/otp_verification/route/otp_verification_argument.dart';
import 'package:club_alt/presentation/feature/otp_verification/route/otp_verification_route.dart';
import 'package:club_alt/presentation/feature/searchticket/route/searchticket_argument.dart';
import 'package:club_alt/presentation/feature/searchticket/route/searchticket_route.dart';
import 'package:club_alt/presentation/feature/skyhome/route/skyhome_argument.dart';
import 'package:club_alt/presentation/localization/ui_text.dart';
import 'package:club_alt/presentation/util/value_notifier_list.dart';

class SkyhomeViewModel extends BaseViewModel<SkyhomeArgument> {
  // final AirportApiService _airportApiService = AirportApiService();

  final ValueNotifierList<Airport> _airports = ValueNotifierList<Airport>([]);

  ValueNotifierList<Airport> get airports => _airports;

  final ValueNotifierList<Airport> _filteredAirports =
      ValueNotifierList<Airport>([]);

  ValueNotifierList<Airport> get filteredAirports => _filteredAirports;

  final ValueNotifier<TravelWay> _selectedWay =
      ValueNotifier(TravelWay.roundTrip);

  ValueListenable<TravelWay> get selectedWay => _selectedWay;

  final ValueNotifier<Airport?> departureAirport = ValueNotifier(null);

  final ValueNotifier<Airport?> arrivalAirport = ValueNotifier(null);

  final ValueNotifier<DateTime> _departureDate = ValueNotifier(
    DateTime.now().add(
      const Duration(days: 3),
    ),
  );

  ValueNotifier<DateTime> get departureDate => _departureDate;

  final ValueNotifier<DateTime> _returnDate = ValueNotifier(
    DateTime.now().add(
      const Duration(days: 5),
    ),
  );

  ValueNotifier<DateTime> get returnDate => _returnDate;

  final ValueNotifier<int> _numberOfAdults = ValueNotifier(1);

  ValueNotifier<int> get numberOfAdults => _numberOfAdults;

  final ValueNotifier<int> _numberOfChildren = ValueNotifier(0);

  ValueNotifier<int> get numberOfChildren => _numberOfChildren;

  final ValueNotifier<int> _numberOfInfants = ValueNotifier(0);

  ValueNotifier<int> get numberOfInfants => _numberOfInfants;

  final ValueNotifier<SeatClass> _seatClass = ValueNotifier(SeatClass.economy);

  ValueNotifier<SeatClass> get seatClass => _seatClass;

  int get totalPassengers =>
      _numberOfAdults.value + _numberOfChildren.value + _numberOfInfants.value;

  final ValueNotifierList<ValueNotifier<MultiCityJourney>> _multiCitySegments =
      ValueNotifierList([
    ValueNotifier(MultiCityJourney(
        departureAirport: Airport.dummyAirport1,
        arrivalAirport: Airport.dummyAirport2,
        departureDate: DateTime.now().add(const Duration(days: 5))))
  ]);

  ValueNotifierList<ValueNotifier<MultiCityJourney>> get multiCitySegments =>
      _multiCitySegments;

  final ValueNotifier<bool> _showEmailBanner = ValueNotifier(false);

  ValueNotifier<bool> get showEmailBanner => _showEmailBanner;

  final ValueNotifier<bool> _showPhoneBanner = ValueNotifier(false);

  ValueNotifier<bool> get showPhoneBanner => _showPhoneBanner;

  final SkyHomeRepository repository;

  SkyhomeViewModel({required this.repository});

  @override
  void onDispose() {
    // TODO: implement onDispose
    super.onDispose();
    _selectedWay.dispose();
  }

  @override
  void onViewReady({SkyhomeArgument? argument}) {
    super.onViewReady();
    //fetchAirports();
    _initUserManager();
    _setCurrentLocation();
    filteredAirports.addListener(() {
      print('Filtered airports: ${filteredAirports.value.length}');
    });
  }

  void onClickSearch() {
    if (departureAirport.value == null || arrivalAirport.value == null) {
      showToast(
          uiText: FixedUiText(
              text: 'Please Select Departure and Arrival Airports'));
      return;
    } else if (departureAirport.value?.code == arrivalAirport.value?.code) {
      showToast(
          uiText: FixedUiText(
              text: 'Departure and Arrival Airports cannot be same'));
      return;
    }

    final flightDetails = buildFlightDetails();

    printAllSelectedInfo(flightDetails);

    navigateToScreen(
      destination: SearchticketRoute(
        arguments: SearchticketArgument(flightDetails),
      ),
    );

    // showSessionErrorDialogue(Icons.error, 'Session Expired', 'OK', (){});
  }

  void updateSelectedWay(TravelWay way) {
    _selectedWay.value = way;
  }

  void updateDepartureAirport(Airport airport) {
    departureAirport.value = airport;
  }

  void updateArrivalAirport(Airport airport) {
    arrivalAirport.value = airport;
  }

  void updateDepartureDate(DateTime date) {
    //final selectedDate = DateToString.dateToCompactString(date);
    _departureDate.value = date;
    _returnDate.value = _departureDate.value.add(const Duration(days: 2));
  }

  void updateReturnDate(DateTime date) {
    //final selectedDate = DateToString.dateToCompactString(date);
    _returnDate.value = date;
  }

  void updateNumberOfAdults(int number) {
    _numberOfAdults.value = number;
  }

  void updateNumberOfChildren(int number) {
    _numberOfChildren.value = number;
  }

  void updateNumberOfInfants(int number) {
    _numberOfInfants.value = number;
  }

  String? incrementNumberOfAdults() {
    if (_numberOfAdults.value + _numberOfChildren.value >= 9) {
      return 'A maximum of 9 adults and children are allowed.';
    }
    _numberOfAdults.value++;
    return null;
  }

  void decrementNumberOfAdults() {
    // The number of adults cannot be less than 1.
    if (_numberOfAdults.value > 1) {
      _numberOfAdults.value--;
      // If the number of infants is now greater than the number of adults,
      // reduce the infant count to match the new adult count.
      if (_numberOfInfants.value > _numberOfAdults.value) {
        _numberOfInfants.value = _numberOfAdults.value;
      }
    }
  }


  String? incrementNumberOfChildren() {
    if (_numberOfAdults.value + _numberOfChildren.value >= 9) {
      return 'A maximum of 9 adults and children are allowed.';
    }
    _numberOfChildren.value++;
    return null;
  }

  void decrementNumberOfChildren() {
    if (_numberOfChildren.value > 0) {
      _numberOfChildren.value--;
    }
  }

  String? incrementNumberOfInfants() {
    if (_numberOfInfants.value >= _numberOfAdults.value) {
      return 'Each adult can only carry one infant.';
    }
    _numberOfInfants.value++;
    return null;
  }

  void decrementNumberOfInfants() {
    if (_numberOfInfants.value > 0) {
      _numberOfInfants.value--;
    }
  }

  void updateSeatClass(SeatClass seatClass) {
    _seatClass.value = seatClass;
  }

  Future<void> filterAirports(String query) async {
    if (query.isEmpty) {

      _filteredAirports.value = [];
    } else {
      try {
        final airports = await repository.getAirports(query: query);
        _filteredAirports.value = airports;
        print('got airports');
      } catch (e) {
        print('Error fetching airports: $e');
      }
    }
  }

  void printAllSelectedInfo(SearchFlightDetails flightDetails) {
    print('Selected way: ${flightDetails.travelWay}');
    print('Selected departure airport: ${flightDetails.departureAirport.name}');
    print('Selected arrival airport: ${flightDetails.arrivalAirport.name}');
    print('Selected departure date: ${flightDetails.departureDate}');
    print('Selected return date: ${flightDetails.returnDate}');
    print('Selected number of adults: ${flightDetails.numberOfAdults}');
    print('Selected number of children: ${flightDetails.numberOfChildren}');
    print('Selected number of infants: ${flightDetails.numberOfInfants}');
    print('Selected seat class: ${flightDetails.seatClass}');
  }

  SearchFlightDetails buildFlightDetails() {
    final flightDetails = SearchFlightDetails(
        travelWay: _selectedWay.value,
        departureAirport: (_selectedWay.value == TravelWay.multiCity)
            ? _multiCitySegments.value.first.value.departureAirport
            : departureAirport.value!,
        arrivalAirport: (_selectedWay.value == TravelWay.multiCity)
            ? _multiCitySegments.value.first.value.arrivalAirport
            : arrivalAirport.value!,
        departureDate: _departureDate.value,
        returnDate: (_selectedWay.value == TravelWay.roundTrip)
            ? _returnDate.value
            : null,
        numberOfAdults: _numberOfAdults.value,
        numberOfChildren: _numberOfChildren.value,
        numberOfInfants: _numberOfInfants.value,
        seatClass: _seatClass.value,
        multiCityJourney: (_selectedWay.value == TravelWay.multiCity)
            ? _multiCitySegments.value.map((segment) => segment.value).toList()
            : null);

    return flightDetails;
  }

  void addJourneySegment() {
    // Get the last segment's departure date
    DateTime lastDepartureDate = _multiCitySegments.value.isNotEmpty
        ? _multiCitySegments.value.last.value.departureDate
        : DateTime.now();

    // Set new segment's departure date 2 days after the last departure date
    DateTime newDepartureDate = lastDepartureDate.add(const Duration(days: 5));

    // Add the new journey segment
    _multiCitySegments.add(ValueNotifier(MultiCityJourney(
      departureAirport: Airport.dummyAirport1,
      arrivalAirport: Airport.dummyAirport2,
      departureDate: newDepartureDate,
    )));
  }

  void removeJourneySegment(int index) {
    if (_multiCitySegments.value.length > 1) {
      _multiCitySegments.removeAt(index);
    }
  }

  void updateJourneySegment(int index,
      {Airport? departure, Airport? arrival, DateTime? date}) {
    if (index < 0 || index >= _multiCitySegments.value.length) return;

    final segmentNotifier =
        _multiCitySegments.value[index]; // Get the existing ValueNotifier
    final updatedSegment = MultiCityJourney(
      departureAirport: departure ?? segmentNotifier.value.departureAirport,
      arrivalAirport: arrival ?? segmentNotifier.value.arrivalAirport,
      departureDate: date ?? segmentNotifier.value.departureDate,
    );

    segmentNotifier.value =
        updatedSegment; // Update the value inside the notifier
  }

  Future<void> _initUserManager() async {
    await UserSessionManager().initializeSharedPreferences();

    await UserSessionManager().refreshCurrentUser();
    if (UserSessionManager().validUser) {
      final SkyUser? user = await UserSessionManager().getCurrentUser();
      if (user != null) {
        if (!user.emailVerified) {
          showEmailBanner.value = true;
        }
        if (!user.phoneNumberVerified) {
          showPhoneBanner.value = true;
        }
      }
    }
  }

  Future<void> onClickVerificationButton() async {
    await repository.sendVerificationLink();
    showEmailBanner.value = false;
  }

  Future<void> onClickSendOTPButton() async {
    showPhoneBanner.value = false;
    await loadData(() => repository.sendOTP());

    navigateToScreen(
      destination: OtpVerificationRoute(arguments: OtpVerificationArgument(onPOP: _initUserManager)),
    );
  }

  void swapDepartureAndArrivalAirports() {
    // Only perform swap if not in multi-city mode
    if (_selectedWay.value != TravelWay.multiCity) {
      final Airport? temp = departureAirport.value;
      departureAirport.value = arrivalAirport.value;
      arrivalAirport.value = temp;
    } else {
      if (kDebugMode) {
        print("Swap airport function is not applicable for multi-city travel.");
      }
    }
  }

  Future<String?> _getCurrentLocation() async {
    return await repository.getCurrentLocation();
  }

  Future<void> _setCurrentLocation() async {
    final currentLocation = await _getCurrentLocation();
    if (currentLocation != null && currentLocation.isNotEmpty) {
      departureAirport.value =
          await repository.getAirport(airportCity: currentLocation);
    }
  }
}
