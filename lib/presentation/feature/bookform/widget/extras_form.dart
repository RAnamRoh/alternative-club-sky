import 'package:flutter/material.dart';

import '../../../values/dimens.dart';
import '../bookform_view_model.dart';

class ExtrasForm extends StatelessWidget {
  final BookformViewModel viewModel;

  ExtrasForm({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey.shade100,
        padding: EdgeInsets.all(Dimens.dimen_20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.sms_outlined,
                  size: Dimens.dimen_24,
                ),
                SizedBox(
                  width: Dimens.dimen_12,
                ),
                Text(
                  'SMS Service',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: Dimens.dimen_15,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: Dimens.dimen_10,
            ),
            _buildBody(context),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.dimen_10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              'Basic',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: Dimens.dimen_12,
                  ),
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
            thickness: 1,
          ),
          _priceSegment(context),
          SelectableButtonsWithViewModel(viewModel: viewModel),
        ],
      ),
    );
  }

  Widget _priceSegment(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get your booking number sent directly to your mobile phone',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey.shade600,
                  fontSize: Dimens.dimen_10,
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(
            height: Dimens.dimen_8,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'Total: ',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: Dimens.dimen_12,
                        ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: viewModel.smsFee,
                      builder: (context, value, child) {
                        return Text(
                          'AU \$${viewModel.smsFee.value}.00',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                                fontSize: Dimens.dimen_12,
                              ),
                        );
                      }),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimens.dimen_8,
          ),
          Text(
            'SMS may be delayed by upto 72 hours from the time of booking',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey.shade600,
                  fontSize: Dimens.dimen_10,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimens.dimen_30),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                viewModel.previousStep();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text("Back",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
            ),
          ),
          SizedBox(
            width: Dimens.dimen_20,
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                viewModel.nextStep();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text("Continue to Pay",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectableButtonsWithViewModel extends StatelessWidget {
  final BookformViewModel viewModel;

  const SelectableButtonsWithViewModel({required this.viewModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ValueListenableBuilder<String?>(
        valueListenable: viewModel.selectedOptionExtra,
        builder: (context, selectedOption, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: buildOptionButton(
                  context: context,
                  label: "No Thanks",
                  isSelected: selectedOption == "No",
                  onTap: () => viewModel.updateSelection("No"),
                ),
              ),

              SizedBox(
                width: Dimens.dimen_10,
              ),

              // Yes Button
              Expanded(
                child: buildOptionButton(
                  context: context,
                  label: "Yes Please",
                  isSelected: selectedOption == "Yes",
                  onTap: () => viewModel.updateSelection("Yes"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildOptionButton({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color:
              isSelected ? Theme.of(context).colorScheme.primary : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 1),
        ),
        child: Row(
          children: [
            // Leading Icon
            Container(
              height: Dimens.dimen_18,
              width: Dimens.dimen_18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.grey.shade300,
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.green, size: 16)
                  : null,
            ),
            SizedBox(width: Dimens.dimen_8), // Space between icon and text
            // Label Text
            Text(label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.dimen_14,
                    )),
          ],
        ),
      ),
    );
  }
}
