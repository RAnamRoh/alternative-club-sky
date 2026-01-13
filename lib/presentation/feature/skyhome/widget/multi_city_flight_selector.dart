import 'package:domain/model/skyClubModels/airport.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/skyhome/skyhome_view_model.dart';
import 'package:sky_club/presentation/feature/skyhome/widget/airport_list_bottom_sheet.dart';
import 'package:sky_club/presentation/util/date_to_string.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class MultiCityFlightSelector extends StatelessWidget {
  final SkyhomeViewModel viewModel;

  const MultiCityFlightSelector({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewModel.multiCitySegments,
      builder: (context, segments, _) {
        return Column(
          children: [
            ...List.generate(segments.length, (index) {
              return ValueListenableBuilder(
                valueListenable:
                    segments[index], // Listen to individual segment changes
                builder: (context, segment, _) {
                  return _buildComponent(
                    context,
                    index,
                    segment.departureAirport,
                    segment.arrivalAirport,
                  );
                },
              );
            }),
          ],
        );
      },
    );
  }

  Widget _buildComponent(
      BuildContext context, int index, Airport departure, Airport arrival) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: Dimens.dimen_10),
          child: Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: _buildAirport(
                        context: context,
                        label: "DEPART FROM",
                        airport: departure,
                        isDeparture: true,
                        index: index,
                      ),
                    ),
                    SizedBox(
                      height: Dimens.dimen_80,
                      child: VerticalDivider(
                          color: Colors.grey, thickness: 1, width: 16),
                    ),
                    Flexible(
                      flex: 1,
                      child: _buildAirport(
                        context: context,
                        label: "DEPART TO",
                        airport: arrival,
                        isDeparture: false,
                        index: index,
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.grey, thickness: Dimens.dimen_1),
                _buildDate(
                    context: context, label: "JOURNEY DAY", index: index),
              ],
            ),
          ),
        ),
       viewModel.multiCitySegments.value.length > 1 ? Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              viewModel.removeJourneySegment(index);
            },
            child: const Icon(
              Icons.clear,
              color: Colors.red,
            ),
          ),
        ) : SizedBox.shrink(),
      ],
    );
  }

  Widget _buildAirport({
    required BuildContext context,
    required String label,
    required Airport airport,
    required bool isDeparture,
    required int index,
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
              isMultiCity: true,
              journeyIndex: index,
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: Dimens.dimen_10,
                  ),
            ),
            SizedBox(height: Dimens.dimen_3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  airport.city,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: Dimens.dimen_12,
                      ),
                ),
                Text(
                  airport.name,
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

  Widget _buildDate({
    required BuildContext context,
    required String label,
    required int index, // Identifies the segment
  }) {
    return GestureDetector(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate:
              viewModel.multiCitySegments.value[index].value.departureDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2101),
        );

        if (selectedDate != null) {
          viewModel.updateJourneySegment(index, date: selectedDate);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(Dimens.dimen_3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: Dimens.dimen_10,
                  ),
            ),
            SizedBox(height: Dimens.dimen_2),
            ValueListenableBuilder(
              valueListenable: viewModel.multiCitySegments,
              builder: (context, multiCitySegments, _) {
                DateTime date = multiCitySegments[index].value.departureDate;
                return Text(
                  DateToString.dateToCompactString(date),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: Dimens.dimen_12,
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
