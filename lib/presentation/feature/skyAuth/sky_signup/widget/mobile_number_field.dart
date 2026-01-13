import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class MobileNumberField extends StatelessWidget {
  final TextEditingController controller;
  final ValueNotifier<PhoneNumber?> phoneNumberNotifier;
  final bool showError;

  const MobileNumberField({
    super.key,
    required this.controller,
    required this.phoneNumberNotifier,
    this.showError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mobile Number *',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: Dimens.dimen_14,
              ),
        ),
        IntlPhoneField(
          controller: controller,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: Dimens.dimen_14,
              ),
          decoration: InputDecoration(
            errorText: showError ? 'Mobile number cannot be empty' : null,
            isDense: true,
            hintText: 'Enter mobile number',
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.dimen_12,
                  color: Colors.grey,
                ),
            errorStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.dimen_12,
                  color: Colors.red.shade900,
                ),
            contentPadding: EdgeInsets.symmetric(
              vertical:
                  Dimens.dimen_25, // Adjust vertical padding to align with country code
              horizontal: 8, // Adjust horizontal padding
            ),
          ),
          initialCountryCode: 'BD', // Default country code
          onChanged: (PhoneNumber phone) {
            phoneNumberNotifier.value = phone;
          },
          validator: (PhoneNumber? phone) {
            if (phone == null || phone.number.isEmpty) {
              return 'Please enter a valid mobile number';
            }
            return null;
          },
        ),
      ],
    );
  }
}
