import 'package:domain/enum/payment_option.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/bookform/bookform_view_model.dart';

import '../../../values/dimens.dart';

class PaymentContent extends StatelessWidget {
  final BookformViewModel viewModel;

  const PaymentContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }


  Widget _buildBody(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(valueListenable: viewModel.selectedOptionPayment,
          builder: (context, selectedPayment, _){
          return Column(
            children: [
              _buildOptionButton(
                context: context,
                paymentOption: PaymentOption.card,
                isSelected: selectedPayment == PaymentOption.card,
                onTap: () => viewModel.updatePaymentOption(PaymentOption.card),
              ),
              SizedBox(height: Dimens.dimen_10,),
              _buildOptionButton(
                context: context,
                paymentOption: PaymentOption.paypal,
                isSelected: selectedPayment == PaymentOption.paypal,
                onTap: () => viewModel.updatePaymentOption(PaymentOption.paypal),
              ),
            ],
          );


          },),
    );
  }


  Widget _buildOptionButton({
    required BuildContext context,
    required PaymentOption paymentOption,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue, width: 1),
        ),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Container(
                height: 15,
                width: 15,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  shape: BoxShape.circle,

                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              paymentOption.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: Dimens.dimen_16,
              ),
            ),
            Spacer(),
            paymentOption.icon
          ],
        ),
      ),
    );
  }





}
