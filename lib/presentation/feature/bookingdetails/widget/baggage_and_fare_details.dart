import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/bookingdetails/bookingdetails_view_model.dart';
import 'package:club_alt/presentation/feature/bookingdetails/widget/bag_detail_tile.dart';

import '../../../values/dimens.dart';


class BaggageAndFareDetails extends StatelessWidget {

  final BookingdetailsViewModel viewModel;

  const BaggageAndFareDetails({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.dimen_20, vertical: Dimens.dimen_20),
        child: ValueListenableBuilder(
            valueListenable: viewModel.baggageFareList,
            builder: (context, value, _) {
              if (value.isEmpty ?? true) {
                return Text(
                  'No baggage information added yet',
                  style: TextStyle(
                      color: Colors.grey, fontSize: Dimens.dimen_14),
                );
              } else {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final model = value[index];
                    return BagDetailTile(
                      model: model,
                    );
                  },
                );
              }
            }
        ),
    );
  }


}
