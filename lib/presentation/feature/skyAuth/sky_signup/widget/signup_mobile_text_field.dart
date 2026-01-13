import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';

import '../../../../values/dimens.dart';

class SignupMobileTextField extends StatelessWidget {
  final TextEditingController mobileController;
  final bool showError;

  const SignupMobileTextField({super.key, required this.mobileController, this.showError = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number *',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: Dimens.dimen_14,
              ),
        ),
        TextField(
          controller: mobileController,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: Dimens.dimen_12,
              ),
          decoration: InputDecoration(
            errorText: showError ? 'Phone number is required' : null,
    errorStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: Dimens.dimen_12,
    color: Colors.red.shade900,
    ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AssetImageView(fileName: 'auFlag.svg'),
                  SizedBox(width: Dimens.dimen_10),
                  Icon(Icons.keyboard_arrow_down_sharp),
                ],
              ),
            ),
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 10),
            hintText: 'Enter your name',
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.dimen_12,
                  color: Colors.grey,
                ),
          ),
        )
      ],
    );
  }
}
