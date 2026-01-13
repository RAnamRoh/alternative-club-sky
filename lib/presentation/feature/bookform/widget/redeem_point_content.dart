import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/bookform/bookform_view_model.dart';
import 'package:sky_club/presentation/feature/bookform/widget/sky_slider.dart';

import '../../../values/dimens.dart';

class RedeemPointContent extends StatelessWidget {
  final BookformViewModel viewModel;

  const RedeemPointContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current point: 555 Points',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: Dimens.dimen_14,
              ),
        ),
        Text(
          'Discount amount: AU \$29',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w500,
            fontSize: Dimens.dimen_14,
          ),
        ),
        _buildSlider(context),
        Text(
          'The availed amount will be deducted from the final price.',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.grey,
                fontSize: Dimens.dimen_14,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }

  Widget _buildSlider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SkySlider(viewModel: viewModel),
    );
  }
}
