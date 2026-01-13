import 'package:domain/enum/passenger_form_error.dart';
import 'package:domain/enum/passenger_type.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/form_text_field.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/reusable_passenger_form.dart';
import 'package:club_alt/presentation/feature/bookform/bookform_view_model.dart';
import 'package:club_alt/presentation/util/value_notifier_list.dart';
import 'package:club_alt/presentation/values/dimens.dart';





class PassengerForm extends StatelessWidget {
  final BookformViewModel viewModel;

  const PassengerForm({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: EdgeInsets.all(Dimens.dimen_20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            SizedBox(
              height: Dimens.dimen_10,
            ),

            ValueListenableBuilder(
              valueListenable: viewModel.passengerList,
              builder: (context, passengerList, child) {
                if (passengerList.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Column(
                  children: List.generate(
                    passengerList.length,
                    (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: Dimens.dimen_10),
                        child: ValueListenableBuilder(
                            valueListenable: viewModel.validationErrorsAt,
                            builder: (context, errorList, child) {
                              print(errorList);
                              return ReusablePassengerForm(
                                title: '${passengerList[index].type.name} ${(passengerList[index].typeIndex) + 1}',
                                index: passengerList[index].typeIndex,
                                type: passengerList[index].type,
                                onFormChanged: (passenger) {
                                  viewModel.updatePassengers(index, passenger);
                                },
                                errorList: errorList[index] != null
                                    ? errorList[index]!
                                    : ValueNotifierList<PassengerFormError>([]),
                              );
                            }
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      children: [
        Transform.flip(
          flipX: true,
          child: Icon(
            Icons.airline_seat_recline_normal,
            color: Theme.of(context).colorScheme.primary,
            size: Dimens.dimen_20,
          ),
        ),
        Transform.flip(
          flipX: true,
          child: Icon(
            Icons.airline_seat_recline_normal,
            color: Theme.of(context).colorScheme.primary,
            size: Dimens.dimen_20,
          ),
        ),
        SizedBox(
          width: Dimens.dimen_10,
        ),
        Text(
          'Passenger details',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: Dimens.dimen_15,
              ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.dimen_20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dimen_5),
          ),
          minimumSize: Size(double.infinity, 40),
        ),
        onPressed: () {
          for (var passenger in viewModel.passengerList.value) {
            print(
                '${passenger.firstName} ${passenger.lastName} ${passenger.dateOfBirth} ${passenger.sex} ${passenger.passportNumber} ${passenger.frequentFlyer}');
          }
          if (viewModel.validatePassengerForms()) {
            print('Validation passed');
            // If validation passes, proceed to next step
            viewModel.nextStep();
          }
          else {
            print('Validation failed');
          }
          //viewModel.nextStep();
        },
        child: Row(
          children: [
            Text(
              'Continue to Extra',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.dimen_16,
                  ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: Dimens.dimen_20,
            ),
          ],
        ),
      ),
    );
  }
}
