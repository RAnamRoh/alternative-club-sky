import 'package:data/remote/response/booking/sms_fee_response.dart';
import 'package:domain/enum/passenger_form_error.dart';
import 'package:domain/enum/passenger_type.dart';
import 'package:domain/enum/payment_option.dart';
import 'package:domain/enum/redirect_page.dart';
import 'package:domain/enum/subscription_level.dart';
import 'package:domain/model/skyClubModels/booking_contact_details.dart';
import 'package:domain/model/skyClubModels/passenger.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';
import 'package:domain/repository/book_form_repository.dart';
import 'package:domain/util/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/feature/auth/validator/email_validator.dart';
import 'package:sky_club/presentation/feature/bookform/route/bookform_argument.dart';
import 'package:sky_club/presentation/feature/payment_web_view/route/payment_web_view_argument.dart';
import 'package:sky_club/presentation/feature/payment_web_view/route/payment_web_view_route.dart';
import 'package:sky_club/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:sky_club/presentation/feature/skybase/route/skybase_route.dart';
import 'package:sky_club/presentation/localization/ui_text.dart';
import 'package:sky_club/presentation/util/value_notifier_list.dart';
import 'package:sky_club/presentation/util/value_notifier_map.dart';

class BookformViewModel extends BaseViewModel<BookformArgument> {


  // ValueNotifier to track the selected option ("Yes" or "No").
  final ValueNotifier<String?> selectedOptionExtra = ValueNotifier<String?>('No');

  final ValueNotifier<bool> _isTermsAccepted = ValueNotifier<bool>(false);

  ValueNotifier<bool> get isTermsAccepted => _isTermsAccepted;

  final ValueNotifier<double> sliderValue = ValueNotifier(0.0);

  final ValueNotifier<PaymentOption> selectedOptionPayment = ValueNotifier<PaymentOption>(PaymentOption.card);

  // Current step notifier
  final ValueNotifier<int> currentStep = ValueNotifier<int>(0);

  final ValueNotifier<String> smsFee = ValueNotifier<String>('');

  ValueNotifierList<PassengerDomain> passengerList = ValueNotifierList<PassengerDomain>([]);

  ValueNotifierMap<int, ValueNotifierList<PassengerFormError>> validationErrorsAt = ValueNotifierMap<int, ValueNotifierList<PassengerFormError>>({});

  BookingContactDetails bookingContactDetails = BookingContactDetails(firstName: '', lastName: '', phoneNo: '', email: '');

  ValueNotifierList<PassengerFormError> bookingContactErrors = ValueNotifierList<PassengerFormError>([]);

  ValueNotifier<SearchedFlightDomain?> selectedFlight = ValueNotifier<SearchedFlightDomain?>(null);

  late int numberOfAdults;
  late int numberOfChildren;
  late int numberOfInfants;
  double totalFare = 0;

  final BookFormRepository bookFormRepository;

  ValueNotifier<String> initialCountryCode = ValueNotifier('BD');
  ValueNotifier<String> initialDialCode = ValueNotifier('+880');
  ValueNotifier<String> initialPhoneNumber = ValueNotifier('');
  final ValueNotifier<PhoneNumber?> phoneNumberNotifier = ValueNotifier(null);
  final TextEditingController phoneController = TextEditingController();

  BookformViewModel({required this.bookFormRepository});


  @override
  void onDispose() {
    // TODO: implement onDispose
    super.onDispose();
    currentStep.dispose();
    selectedOptionExtra.dispose();
    _isTermsAccepted.dispose();
    sliderValue.dispose();
    selectedOptionPayment.dispose();
    passengerList.dispose();
    validationErrorsAt.dispose();
    bookingContactErrors.dispose();
  }


  @override
  void onViewReady({BookformArgument? argument}) {
    super.onViewReady();

    if (argument != null) {
      final flightDetails = argument.flightDetails;
      numberOfAdults = flightDetails.numberOfAdults;
      numberOfChildren = flightDetails.numberOfChildren;
      numberOfInfants = flightDetails.numberOfInfants;
      totalFare = argument.selectedFlight.totalPrice;
      _initializePassengers(flightDetails.numberOfAdults, flightDetails.numberOfChildren, flightDetails.numberOfInfants);
      selectedFlight.value = argument.selectedFlight;

      getSmsFee();

      selectedOptionExtra.addListener((){
        if (selectedOptionExtra.value == 'Yes') {
          //TODO: Get INT VALUE OF SMS FEE
          totalFare = argument.selectedFlight.totalPrice + int.parse(smsFee.value);
        } else {
          totalFare = argument.selectedFlight.totalPrice;
        }
      });
    }






  }


  void _initializePassengers(int adults, int children, int infants) {


    final adultsPassengers = [
      ...List.generate(adults, (index) => PassengerDomain(type: PassengerType.adult, typeIndex: index)),
    ];

    final childrenPassengers = [
      ...List.generate(children, (index) => PassengerDomain(type: PassengerType.child, typeIndex: index)),
    ];

    final infantsPassengers = [
      ...List.generate(infants, (index) => PassengerDomain(type: PassengerType.infant, typeIndex: index)),
    ];

    passengerList.value = [...adultsPassengers, ...childrenPassengers, ...infantsPassengers];



  }


  // Navigate to the next step
  void nextStep() {
    if (currentStep.value < 3) {
      currentStep.value += 1;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value -= 1;
    }
  }

  // Method to update the selected option.
  void updateSelection(String option) {
    selectedOptionExtra.value = option;
  }

  void updateTermsAccepted(bool value){
    _isTermsAccepted.value = value;
    print(isTermsAccepted);
  }

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }

  void updatePaymentOption(PaymentOption option) {
    selectedOptionPayment.value = option;
  }

  void onClickHome() {
    navigateToScreen(destination: SkybaseRoute(arguments: SkybaseArgument()), isClearBackStack: true);
  }


  void updatePassengers(int index,PassengerDomain passenger) {
    passengerList.value[index] = passenger;
  }




  bool validatePassengerForms() {
    bool isValid = true;

    for (int i = 0; i < passengerList.value.length; i++) {
      final passenger = passengerList.value[i];

      // Create a list of validation errors
      List<PassengerFormError> validationErrors = [];

      // Required field validations
      if (passenger.firstName == null || passenger.firstName!.isEmpty) {
        validationErrors.add(PassengerFormError.firstName);
      }
      if (passenger.lastName == null || passenger.lastName!.isEmpty) {
        validationErrors.add(PassengerFormError.lastName);
      }
      if (passenger.dateOfBirth == null) {
        validationErrors.add(PassengerFormError.dob);
      }


      // If we found any validation errors
      if (validationErrors.isNotEmpty) {
        isValid = false;
        // Notify the form widget about which fields need validation
        notifyValidationErrors(i, validationErrors);
      } else {
        // Clear the validation errors
        clearValidationErrors(i);
      }
    }

    return isValid;
  }


  void notifyValidationErrors(int passengerIndex, List<PassengerFormError> fieldNames) {
    if (!validationErrorsAt.value.containsKey(passengerIndex)) {
      validationErrorsAt.add(passengerIndex, ValueNotifierList<PassengerFormError>(fieldNames));
    } else {
      validationErrorsAt.value[passengerIndex]?.value = fieldNames;
    }
  }


  void clearValidationErrors(int passengerIndex) {
    validationErrorsAt.value = Map<int, ValueNotifierList<PassengerFormError>>.from(validationErrorsAt.value)
      ..remove(passengerIndex);
  }


  void updateBookingContactDetails(BookingContactDetails bookingContactDetails) {
    this.bookingContactDetails = bookingContactDetails;
  }

  bool validateBookingContactDetails() {
    bool isValid = true;

    List<PassengerFormError> errors = [];

    if (bookingContactDetails.firstName.isEmpty){
      errors.add(PassengerFormError.firstName);
    }
    if (bookingContactDetails.lastName.isEmpty){
      errors.add(PassengerFormError.lastName);
    }
    if (bookingContactDetails.phoneNo.isEmpty){
      errors.add(PassengerFormError.mobile);
    }
    if (bookingContactDetails.email.isEmpty || !EmailValidator.isValid(bookingContactDetails.email)){
      errors.add(PassengerFormError.email);
    }




    if (errors.isNotEmpty){
      bookingContactErrors.value = errors;
      isValid = false;
     // showToast(uiText: FixedUiText(text: 'Please Fill the Required Fields'));
    } else {
      bookingContactErrors.value.clear();
    }



    return isValid;
  }

  Future<void> bookTicket() async {

    // await bookFormRepository.bookTicket(
    //     passengerList: passengerList.value,
    //     searchedFlight: selectedFlight.value!,
    //     bookingDetails: bookingContactDetails
    // );

   final String bookingId = await loadData(() => bookFormRepository.bookTicket(
        passengerList: passengerList.value,
        searchedFlight: selectedFlight.value!,
        bookingDetails: bookingContactDetails,
       hasSMS: selectedOptionExtra.value == 'Yes' ? true : false,
    ));
   if (bookingId.isNotEmpty){
     await makePayment(bookingId: bookingId);
   }


  }

  Future<void> makePayment({required String bookingId,}) async {

    final String response = await loadData(() => bookFormRepository.makePayment(bookingId: bookingId));

    if(response.isNotEmpty){
      navigateToScreen(destination: PaymentWebViewRoute(arguments: PaymentWebViewArgument(checkoutUrl: response, redirectUrl: RedirectPage.flightBookSuccess, viewModel: this)));
    }else{
      showToast(uiText: FixedUiText(text: 'Something went wrong'));
    }



  }

  Future<void> getSmsFee() async {

    final SmsFeeResponse response = await loadData(() => bookFormRepository.getSmsFee());

    smsFee.value = response.value;

    Logger.debug('SMS Fee: ${smsFee.value}');

  }

  void parsePhoneNumber(String input) {
    // Regular expression to match the pattern
    RegExp regex = RegExp(r"(\w+)\|(\+\d+)-(\d+)");

    // Match the input string against the regex
    Match? match = regex.firstMatch(input);

    if (match != null) {
      String countryCode = match.group(1) ?? ""; // Extract country code
      String dialCode = match.group(2) ?? ""; // Extract dial code
      String phoneNumber = match.group(3) ?? ""; // Extract phone number

      initialCountryCode.value = countryCode;
      initialDialCode.value = dialCode;
      initialPhoneNumber.value = phoneNumber;
      phoneController.text = initialPhoneNumber.value;

      debugPrint("phone number: $initialPhoneNumber");

      PhoneNumber initialNumber = PhoneNumber(
          countryISOCode: initialCountryCode.value,
          countryCode: initialDialCode.value,
          number: initialPhoneNumber.value);
      phoneNumberNotifier.value = initialNumber;
    } else {
      // Handle invalid input (e.g., throw an exception or return an error map)
      debugPrint("Invalid phone number format: $input"); // Optional debug print

      // Or, if you want to throw an exception:
      // throw FormatException("Invalid phone number format: $input");
    }
  }

  String getPhoneNumber(){
    final phoneNumber = phoneNumberNotifier.value;
    if (phoneNumber == null || phoneNumber.number.isEmpty) {
      debugPrint('Mobile number is invalid');
      return 0.toString();
    }

    // Extract the country code (e.g., "BD") and the complete number (e.g., "+8801677397270")
    final countryCode = phoneNumber.countryISOCode; // e.g., "BD"
    final completeNumber = phoneNumber.completeNumber; // e.g., "+8801677397270"

    // Split the complete number into country code and local number
    final countryDialCode = phoneNumber.countryCode; // e.g., "+880"
    final localNumber = phoneNumber.number; // e.g., "1677397270"

    // Format the mobile number as "BD|+880-1677397270"
    final formattedMobileNumber = '$countryCode|$countryDialCode-$localNumber';

    return formattedMobileNumber;
  }

}
