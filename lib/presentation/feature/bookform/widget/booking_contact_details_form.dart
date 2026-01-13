import 'package:data/sessionManager/user_session_manager.dart';
import 'package:domain/enum/passenger_form_error.dart';
import 'package:domain/model/skyClubModels/booking_contact_details.dart';
import 'package:domain/model/skyClubModels/sky_user.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/form_text_field.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/mobile_form_text_field.dart';
import 'package:sky_club/presentation/feature/bookform/bookform_view_model.dart';
import 'package:sky_club/presentation/util/value_notifier_list.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class BookingContactDetailsForm extends StatefulWidget {
  final Function(BookingContactDetails) onFormChanged;
  final ValueNotifierList<PassengerFormError> errorList;
  final BookformViewModel viewModel;

  BookingContactDetailsForm(
      {super.key, required this.onFormChanged, required this.errorList, required this.viewModel});

  @override
  State<BookingContactDetailsForm> createState() =>
      _BookingContactDetailsFormState();
}

class _BookingContactDetailsFormState extends State<BookingContactDetailsForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  @override
  void initState() {
    super.initState();
 setData();
    widget.onFormChanged(_getBookingContactDetails());
    _addListener();
  }

  Future<void> setData() async {
   // UserSessionManager().initializeSharedPreferences();
    if(!UserSessionManager().needLogin){
      final SkyUser? user = await UserSessionManager().getCurrentUser();

      if (user != null){
        firstNameController.text = user.givenName ?? '';
        lastNameController.text = user.familyName ?? '';
        emailController.text = user.email ?? '';
        widget.viewModel.parsePhoneNumber(user.phoneNumber ?? '');
        //phoneController.text = user.phoneNumber ?? '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildForm(context);
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimen_16, horizontal: Dimens.dimen_16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.dimen_8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ValueListenableBuilder(
          valueListenable: widget.errorList,
          builder: (context, errorList, child) {
            return Column(
              children: [
                FormTextField(
                  controller: firstNameController,
                  label: 'First Name',
                  hintText: 'Enter First Name',
                  textInputType: TextInputType.text,
                  errorText: errorList.contains(PassengerFormError.firstName) ? 'Please enter your name' : null,
                ),
                SizedBox(
                  height: Dimens.dimen_16,
                ),
                FormTextField(
                  controller: lastNameController,
                  label: 'Last Name',
                  hintText: 'Enter Last Name',
                  textInputType: TextInputType.text,
                  errorText:  errorList.contains(PassengerFormError.lastName) ? 'Please enter your Last Name' : null,
                ),
                SizedBox(
                  height: Dimens.dimen_16,
                ),
                // FormTextField(
                //   controller: phoneController,
                //   label: 'Phone Number',
                //   hintText: '+8801911282835',
                //   textInputType: TextInputType.number,
                //   errorText: errorList.contains(PassengerFormError.mobile) ? 'Please enter your Phone Number' : null,
                // ),
                ValueListenableBuilder(valueListenable: widget.viewModel.initialCountryCode,
                    builder: (context, currentCountryCode, _){
                      return MobileFormTextField(
                        controller: widget.viewModel.phoneController,
                        phoneNumberNotifier: widget.viewModel.phoneNumberNotifier,
                        countryCode: currentCountryCode,
                        phoneNumber: widget.viewModel.initialPhoneNumber.value,
                        showError: false,
                      );
                    }),
                SizedBox(
                  height: Dimens.dimen_16,
                ),
                FormTextField(
                  controller: emailController,
                  label: 'Email',
                  hintText: 'Enter Email',
                  textInputType: TextInputType.text,
                  errorText: errorList.contains(PassengerFormError.email) ? 'Please enter a Valid Email' : null,
                ),
                SizedBox(
                  height: Dimens.dimen_16,
                ),
                Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        firstNameController.clear();
                        lastNameController.clear();
                        widget.viewModel.phoneController.clear();
                        emailController.clear();
                      },
                      child: Text(
                        'Clear all Inputs',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.red.shade800,
                          fontSize: Dimens.dimen_12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            );
          }
      ),
    );
  }

  BookingContactDetails _getBookingContactDetails() {
    return BookingContactDetails(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phoneNo: widget.viewModel.getPhoneNumber(),
    );
  }

  void _addListener() {
    firstNameController.addListener(() {
      widget.onFormChanged(_getBookingContactDetails());
    });
    lastNameController.addListener(() {
      widget.onFormChanged(_getBookingContactDetails());
    });
    emailController.addListener(() {
      widget.onFormChanged(_getBookingContactDetails());
    });
    widget.viewModel.phoneController.addListener(() {
      widget.onFormChanged(_getBookingContactDetails());
    });
  }
}
