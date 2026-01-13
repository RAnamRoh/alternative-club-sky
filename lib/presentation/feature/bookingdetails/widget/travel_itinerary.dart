import 'package:domain/model/skyClubModels/fare_rules_model.dart';
import 'package:domain/model/skyClubModels/travel_itinerary_model.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/bookingdetails/widget/travel_itinerary_tile.dart';

import '../../../values/dimens.dart';
import '../bookingdetails_view_model.dart';

class TravelItinerary extends StatelessWidget {
  final BookingdetailsViewModel viewModel;

  const TravelItinerary({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20),
      child: ValueListenableBuilder(
          valueListenable: viewModel.travelItineraryList,
          builder: (context, value, _) {
            if (value.isEmpty ?? true) {
              return Text(
                'No Travel Itinerary added yet',
                style: TextStyle(
                    color: Colors.grey, fontSize: Dimens.dimen_14),
              );
            } else {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final model = value[index];
                  return TravelItineraryTile(model: model, fareRule: FareRulesModel.dummyModel);
                },
              );
            }
          }
      ),
    );
  }
}
