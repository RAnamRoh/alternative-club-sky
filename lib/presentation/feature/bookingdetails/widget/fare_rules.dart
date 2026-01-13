import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/bookingdetails/bookingdetails_view_model.dart';
import 'package:club_alt/presentation/feature/bookingdetails/widget/fare_rule_tile.dart';

import '../../../values/dimens.dart';



class FareRules extends StatelessWidget {
  final BookingdetailsViewModel viewModel;
  const FareRules({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_20, vertical: Dimens.dimen_20),
      child: ValueListenableBuilder(
          valueListenable: viewModel.fareRulesList,
          builder: (context, value, _) {
            if (value.isEmpty ?? true) {
              return Text(
                'No Fare Rules added yet',
                style: TextStyle(
                    color: Colors.grey, fontSize: Dimens.dimen_14),
              );
            } else {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final rule = value[index];
                  return FareRuleTile(rule: rule);
                },
              );
            }
          }
      ),
    );
  }
}
