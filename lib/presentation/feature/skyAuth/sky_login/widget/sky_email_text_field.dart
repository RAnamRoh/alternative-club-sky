import 'package:flutter/material.dart';

import '../../../../values/dimens.dart';

class SkyEmailTextField extends StatelessWidget {
  final TextEditingController emailTextEditingController;
  final String? errorText;

  const SkyEmailTextField({
    super.key,
    required this.emailTextEditingController,
    this.errorText,
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
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(5, 10, 0, 10),
            hintText: 'Enter email',
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.dimen_12,
                  color: Colors.grey,
                ),
            errorText: errorText,
            errorStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: Dimens.dimen_12,
              color: Colors.red.shade900,
            )
          ),
        )
      ],
    );
  }
}
