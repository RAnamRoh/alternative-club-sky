import 'package:domain/model/skyClubModels/passenger_info_model.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/bookingdetails/bookingdetails_view_model.dart';
import 'package:sky_club/presentation/feature/bookingdetails/widget/passenger_info_tile.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class PassengerInfo extends StatelessWidget {
  final BookingdetailsViewModel viewModel;

  const PassengerInfo({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.dimen_20, vertical: Dimens.dimen_20),
        child: ValueListenableBuilder(
            valueListenable: viewModel.passengerInfoList,
            builder: (context, value, child) {
              if (value.isEmpty ?? true) {
                return Text(
                  'No passenger information added yet',
                  style: TextStyle(
                      color: Colors.grey, fontSize: Dimens.dimen_14),
                );
              } else {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final model = value[index];
                    return PassengerInfoTile(
                      model: model,
                    );
                  },
                );
              }
            }));
  }
}
