import 'package:flutter/material.dart';

import '../../../../values/dimens.dart';

class SignUpNameTextField extends StatelessWidget {
  final TextEditingController nameTextEditingController;
  final String label;
  final bool showError;


  const SignUpNameTextField({
    super.key,
    required this.nameTextEditingController,
    required this.label,
    this.showError = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: Dimens.dimen_14,
          ),
        ),
        TextField(
          controller: nameTextEditingController,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: Dimens.dimen_12,
          ),
          decoration: InputDecoration(
            errorText: showError ? 'Name cannot be empty' : null,
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 10),
            hintText: 'Enter your name',
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
        )
      ],
    );
  }
}
