import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class MobileFormTextField extends StatefulWidget {
  final TextEditingController controller;
  final ValueNotifier<PhoneNumber?> phoneNumberNotifier;
  final bool showError;
  final String countryCode;
  final String phoneNumber; // Example: "BD|+880-1677397270"

  const MobileFormTextField({
    super.key,
    required this.controller,
    required this.phoneNumberNotifier,
    required this.countryCode,
    required this.phoneNumber,
    this.showError = false,
  });

  @override
  State<MobileFormTextField> createState() => _MobileFormTextFieldState();
}

class _MobileFormTextFieldState extends State<MobileFormTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Color(0xFF4F4F4F),
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
        ),
        SizedBox(height: Dimens.dimen_5),
        IntlPhoneField(
          key: ValueKey(widget.countryCode),
          controller: widget.controller,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: Dimens.dimen_12,
              ),
          dropdownTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: Dimens.dimen_12,
              ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(Dimens.dimen_10),
            hintText: 'Enter mobile number',
            hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Color(0xFF9B9B9B),
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.dimen_12,
                ),
            errorText:
                widget.showError ? 'Mobile number cannot be empty' : null,
            errorStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.red.shade800,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.dimen_12,
                ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: BorderSide(
                color: Colors.red.shade800,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: BorderSide(
                color: Colors.grey.shade800,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: BorderSide(
                color: Colors.grey, // Default border color
              ),
            ),
          ),
          initialCountryCode: widget.countryCode, // ✅ Correct country code
          initialValue:
              widget.phoneNumber, // ✅ Correctly extracted phone number
          onChanged: (PhoneNumber phone) {
            widget.phoneNumberNotifier.value = phone;
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
