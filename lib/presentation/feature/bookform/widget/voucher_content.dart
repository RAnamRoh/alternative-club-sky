import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/form_text_field.dart';
import 'package:club_alt/presentation/feature/bookform/bookform_view_model.dart';

import '../../../values/dimens.dart';

class VoucherContent extends StatelessWidget {
  final BookformViewModel viewModel;

  final TextEditingController controller = TextEditingController();

  VoucherContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormTextField(
          controller: controller,
          label: 'Promo or voucher code',
          hintText: 'Promo or voucher code',
          textInputType: TextInputType.text,
        ),
        SizedBox(height: Dimens.dimen_16,),
        ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
            ),
            minimumSize: Size(double.infinity, 40),
          ),
            child: Text('Apply code',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: Dimens.dimen_14,
            ),
            ),
        ),
      ],
    );
  }
}
