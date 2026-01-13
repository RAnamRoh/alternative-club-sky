import 'package:flutter/material.dart';
import 'package:club_alt/presentation/values/dimens.dart';



class SignUpEmailTextField extends StatelessWidget {
  final TextEditingController emailTextEditingController;
  final bool showError;
  final bool isEmailValid; // Add this parameter

  const SignUpEmailTextField({
    super.key,
    required this.emailTextEditingController,
    this.showError = false,
    this.isEmailValid = true, // Default to true
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email *',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: Dimens.dimen_14,
          ),
        ),
        TextField(
          controller: emailTextEditingController,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: Dimens.dimen_12,
          ),
          decoration: InputDecoration(
            errorText: showError
                ? 'Email cannot be empty'
                : !isEmailValid
                ? 'Please enter a valid email address'
                : null,
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 10),
            hintText: 'Enter email',
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
          ),
        ),
      ],
    );
  }
}
