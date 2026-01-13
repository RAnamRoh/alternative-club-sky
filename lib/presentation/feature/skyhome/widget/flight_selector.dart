import 'dart:math';

import 'package:domain/model/skyClubModels/airport.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/feature/skyhome/skyhome_view_model.dart';
import 'package:club_alt/presentation/values/dimens.dart';

import 'airport_list_bottom_sheet.dart';

class FlightSelector extends StatelessWidget {
  final SkyhomeViewModel viewModel;

  const FlightSelector({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Section: DEPART FROM
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: viewModel.departureAirport,
              builder: (context, airport, _) {
                return _buildAirport(
                  context: context,
                  label: "DEPART FROM",
                  airport: airport,
                  isDeparture: true,
                );
              },
            ),
          ),

          // Vertical Divider with Swap Icon
           SizedBox(
            height: 100, // Specify height for the divider
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
               const VerticalDivider(
                  color: Colors.grey, // Divider color
                  thickness: 1, // Divider thickness
                  width: 16, // Space taken by the divider
                ),
                _buildSwapImage(),
              ],
            ),
          ),

          // Right Section: DEPART TO
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: viewModel.arrivalAirport,
              builder: (context, airport, _) {
                return _buildAirport(
                  context: context,
                  label: "DEPART TO",
                  airport: airport,
                  isDeparture: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAirport({
    required BuildContext context,
    required String label,
    required Airport? airport,
    required bool isDeparture,
  }) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          showDragHandle: true,
          builder: (context) {
            return AirportListBottomSheet(
              viewModel: viewModel,
              isDeparture: isDeparture,
              isMultiCity: false,
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall,
            ),
             SizedBox(height: Dimens.dimen_8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  airport?.city ?? 'Select a City',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  airport?.name ?? 'Select Airport',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwapImage() {
    return GestureDetector(
      onTap: (){
        viewModel.swapDepartureAndArrivalAirports();
      },
      child: AssetImageView(
        fileName: 'flip.svg',
        height: Dimens.dimen_30,
        width: Dimens.dimen_30,
      ),
    );
  }
}