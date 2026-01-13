import 'package:domain/enum/passenger_form_error.dart';
import 'package:domain/model/skyClubModels/booking_contact_details.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/form_text_field.dart';
import 'package:club_alt/presentation/feature/bookform/bookform_view_model.dart';
import 'package:club_alt/presentation/feature/bookform/widget/booking_contact_details_form.dart';
import 'package:club_alt/presentation/feature/bookform/widget/flight_route_card.dart';
import 'package:club_alt/presentation/feature/bookform/widget/payment_content.dart';
import 'package:club_alt/presentation/feature/bookform/widget/redeem_point_content.dart';
import 'package:club_alt/presentation/feature/bookform/widget/short_booking_summary.dart';
import 'package:club_alt/presentation/feature/bookform/widget/voucher_content.dart';
import 'package:club_alt/presentation/util/big_text.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class PaymentForm extends StatelessWidget {
  final BookformViewModel viewModel;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  PaymentForm({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: EdgeInsets.all(Dimens.dimen_20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBooikingContactDetails(context),
            SizedBox(
              height: Dimens.dimen_20,
            ),
            _buildRedeem(context),
            SizedBox(
              height: Dimens.dimen_20,
            ),
            _buildPayment(context),
            SizedBox(
              height: Dimens.dimen_20,
            ),
            _buildBookingSummary(context),
            SizedBox(
              height: Dimens.dimen_20,
            ),
           ...viewModel.selectedFlight.value!.journeys.map((journey) => Padding(
             padding: EdgeInsets.only(
               bottom: Dimens.dimen_10,
             ),
             child: FlightRouteCard( journey: journey),
           )),
           // FlightRouteCard(viewModel: viewModel,),
            _termsAndConditions(context),
            _buildNote(context),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimens.dimen_30),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                viewModel.previousStep();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                "Back",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: Dimens.dimen_20,
          ),
          Expanded(
            flex: 1,
            child: ValueListenableBuilder<bool>(
              valueListenable: viewModel
                  .isTermsAccepted, // ValueNotifier<bool> in your ViewModel
              builder: (context, isEnabled, _) {
                return ElevatedButton(
                  onPressed: isEnabled
                      ? validate
                      : null, // Disable if `isEnabled` is false
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEnabled
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey, // Change color when disabled
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    "Checkout",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNote(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please Note',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _buildNoteBody(context, BigText.paymentPolicy1),
        const SizedBox(height: 8),
        _buildNoteBody(context, BigText.paymentPolicy2),
      ],
    );
  }

  Widget _buildNoteBody(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check,
          color: Colors.grey.shade900,
        ),
        const SizedBox(width: 8), // Add spacing between icon and text
        Expanded(
          // Wraps text and allows it to use remaining space
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.dimen_16,
                  color: Colors.grey.shade900,
                ),
            softWrap: true,
          ),
        ),
      ],
    );
  }

  Widget _buildBooikingContactDetails(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.perm_contact_cal_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: Dimens.dimen_24,
            ),
            SizedBox(
              width: Dimens.dimen_12,
            ),
            Text(
              'Booking Contact Details',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.dimen_15,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.dimen_10,
        ),
        BookingContactDetailsForm(
            onFormChanged: (data) {
              viewModel.updateBookingContactDetails(data);
            },
            errorList: viewModel.bookingContactErrors,
          viewModel: viewModel,
        )
      ],
    );
  }

  Widget _bookingform(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewModel.bookingContactErrors,
        builder: (context, value, _) {
          return Column(
            children: [
              FormTextField(
                controller: firstNameController,
                label: 'First Name',
                hintText: 'Enter First Name',
                textInputType: TextInputType.text,
                errorText: value.contains(PassengerFormError.firstName)
                    ? 'Please enter your name'
                    : null,
              ),
              SizedBox(
                height: Dimens.dimen_16,
              ),
              FormTextField(
                controller: lastNameController,
                label: 'Last Name',
                hintText: 'Enter Last Name',
                textInputType: TextInputType.text,
                errorText: value.contains(PassengerFormError.lastName)
                    ? 'Please enter your Last Name'
                    : null,
              ),
              SizedBox(
                height: Dimens.dimen_16,
              ),
              FormTextField(
                controller: phoneController,
                label: 'Phone Number',
                hintText: '+8801911282835',
                textInputType: TextInputType.number,
                errorText: value.contains(PassengerFormError.mobile)
                    ? 'Please enter your Phone Number'
                    : null,
              ),
              SizedBox(
                height: Dimens.dimen_16,
              ),
              FormTextField(
                controller: emailController,
                label: 'Email',
                hintText: 'Enter Email',
                textInputType: TextInputType.text,
                errorText: value.contains(PassengerFormError.email)
                    ? 'Please enter a Valid Email'
                    : null,
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
                      phoneController.clear();
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
        });
  }

  Widget _buildRedeem(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.emoji_events_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: Dimens.dimen_24,
            ),
            SizedBox(
              width: Dimens.dimen_12,
            ),
            Text(
              'Redeem point',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.dimen_15,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.dimen_10,
        ),
        Container(
          padding: EdgeInsets.all(Dimens.dimen_20),
          width: double.infinity,
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
          child: RedeemPointContent(viewModel: viewModel),
        ),
        SizedBox(
          height: Dimens.dimen_20,
        ),
        Container(
          padding: EdgeInsets.all(Dimens.dimen_20),
          width: double.infinity,
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
          child: VoucherContent(viewModel: viewModel),
        ),
      ],
    );
  }

  Widget _buildPayment(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.payment,
              color: Theme.of(context).colorScheme.primary,
              size: Dimens.dimen_24,
            ),
            SizedBox(
              width: Dimens.dimen_12,
            ),
            Text(
              'Payment',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.dimen_15,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.dimen_10,
        ),
        Container(
          padding: EdgeInsets.all(Dimens.dimen_20),
          width: double.infinity,
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
          child: PaymentContent(viewModel: viewModel),
        )
      ],
    );
  }

  Widget _buildBookingSummary(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.note_alt_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: Dimens.dimen_24,
            ),
            SizedBox(
              width: Dimens.dimen_12,
            ),
            Text(
              'Booking Summary',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.dimen_15,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.dimen_10,
        ),
        Container(
          width: double.infinity,
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
          child: ShortBookingSummary(viewModel: viewModel),
        )
      ],
    );
  }

  Widget _termsAndConditions(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity, // Ensures the parent container takes full width
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: viewModel.isTermsAccepted,
            builder: (context, value, _) {
              return Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: value,
                onChanged: (newValue) {
                  viewModel.updateTermsAccepted(newValue!);
                },
              );
            },
          ),
          const SizedBox(width: 8), // Add spacing between the checkbox and text
          Expanded(
            child: Text(
              BigText.agreeToTerms,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.dimen_14,
                    color: Colors.grey.shade900,
                  ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> fillBookingContactDetails() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String phoneNo = phoneController.text;

    BookingContactDetails details = BookingContactDetails(
        firstName: firstName,
        lastName: lastName,
        phoneNo: phoneNo,
        email: email);
    viewModel.updateBookingContactDetails(details);
  }

  void validate() async {
    ///await fillBookingContactDetails();

    if (viewModel.validateBookingContactDetails()) {
      //viewModel.nextStep();
      viewModel.bookTicket();
    }
  }
}
