import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/bookform/bookform_view_model.dart';

import '../../../values/dimens.dart';


class ShortBookingSummary extends StatelessWidget {

  final BookformViewModel viewModel;

  const ShortBookingSummary({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(

            children: [
              _buildInfoRow(context, 'Total flights', 'AU \$${viewModel.selectedFlight.value?.totalPrice}', true),
              Divider(
                color: Colors.grey.shade400,
                thickness: 1,
              ),
              _buildInfoRow(context, 'Adult Fare x ${viewModel.numberOfAdults}', 'AU \$${(viewModel.selectedFlight.value!.pricePerPerson * viewModel.numberOfAdults)}', false),

              viewModel.selectedFlight.value?.pricePerChild != null ?
              Column(
                children: [
                  Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                  _buildInfoRow(context, 'Child Fare x ${viewModel.numberOfChildren}', 'AU \$${(viewModel.selectedFlight.value!.pricePerChild! * viewModel.numberOfChildren)}', false),
                ],
              ) :
              const SizedBox.shrink(),

              viewModel.selectedFlight.value?.pricePerInfant != null ?
              Column(
                children: [
                  Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                  _buildInfoRow(context, 'Infant Fare x ${viewModel.numberOfInfants}', 'AU \$${(viewModel.selectedFlight.value!.pricePerInfant! * viewModel.numberOfInfants)}', false),
                ],
              ) :
              const SizedBox.shrink(),

              viewModel.selectedOptionExtra.value == 'Yes' ?
              Column(
                children: [
                  Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                  _buildInfoRow(context, 'SMS Fee', 'AU \$${viewModel.smsFee.value}.0', false),
                ],
              ) :
              const SizedBox.shrink(),

            ],
          ),
        ),
      _buildTotal(context),
      ],
    );
  }


  Widget _buildInfoRow(BuildContext context, String title, String value, bool isBold) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: isBold ? FontWeight.w500 : FontWeight.w400,
              fontSize: Dimens.dimen_14,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: isBold ? FontWeight.w500 : FontWeight.w400,
              fontSize: Dimens.dimen_14,
            ),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }

  Widget _buildTotal(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xFFDCDEFF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )
      ),
      child: Center(
        child: Row(
          children: [
            Text(
              'Total (inc. taxes)',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: Dimens.dimen_14,
                color: Theme.of(context).colorScheme.primary

              ),
            ),
            Spacer(),
        Text(
          'AU \$${viewModel.totalFare}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: Dimens.dimen_14,
              color: Theme.of(context).colorScheme.primary

          ),
        ),
          ],
        ),
      ),
    );
  }


}
