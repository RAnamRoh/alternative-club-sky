import 'package:domain/enum/travel_way.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/skyhome/skyhome_view_model.dart';
import 'package:sky_club/presentation/util/date_to_string.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class FlightDateSelector extends StatelessWidget {
  final SkyhomeViewModel viewModel;

  const FlightDateSelector({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Dimens.dimen_10, 0, Dimens.dimen_10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_8),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: ValueListenableBuilder(
        valueListenable: viewModel.selectedWay,
        builder: (context, selectedWay, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Date Picker (Journey Day)
              Expanded(
                child: _buildDate(
                  context: context,
                  isDeparture: true,
                  label: "JOURNEY DAY",
                ),
              ),

              // Vertical Divider
              const SizedBox(
                height: 100, // Specify height for the divider
                child: VerticalDivider(
                  color: Colors.grey, // Divider color
                  thickness: 1, // Divider thickness
                  width: 16, // Space taken by the divider
                ),
              ),

              // Right Date Picker or Return Date Prompt
              Expanded(
                child: selectedWay == TravelWay.oneWay
                    ? GestureDetector(
                        onTap: () {
                          viewModel.updateSelectedWay(TravelWay.roundTrip);
                        },
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'RETURN DATE',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              SizedBox(height: Dimens.dimen_8),
                              Text(
                                'Save more on return flights',
                                style: Theme.of(context).textTheme.titleSmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      )
                    : _buildDate(
                        context: context,
                        isDeparture: false,
                        label: "RETURN DATE",
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDate(
      {required BuildContext context,
      required String label,
      required bool isDeparture}) {
    return GestureDetector(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: isDeparture
              ? viewModel.departureDate.value
              : viewModel.returnDate.value,
          firstDate: isDeparture
              ? DateTime.now()
              : viewModel.departureDate.value
                  .add(Duration(days: 1)), //viewModel.returnDate.value,
          lastDate: DateTime(2101),
        );
        if (selectedDate != null) {
          if (isDeparture) {
            viewModel.updateDepartureDate(selectedDate);
          } else {
            viewModel.updateReturnDate(selectedDate);
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: Dimens.dimen_8),
            isDeparture
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                          valueListenable: viewModel.departureDate,
                          builder: (context, date, _) {
                            return Text(DateToString.dateToCompactString(date),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ));
                          }),
                      ValueListenableBuilder(
                          valueListenable: viewModel.departureAirport,
                          builder: (context, airport, _) {
                            return airport != null
                                ? Text(
                                    airport.name,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : Text(
                                    'Select airport',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  );
                          }),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                          valueListenable: viewModel.returnDate,
                          builder: (context, date, _) {
                            return Text(DateToString.dateToCompactString(date),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ));
                          }),
                      ValueListenableBuilder(
                          valueListenable: viewModel.arrivalAirport,
                          builder: (context, airport, _) {
                            return

                            airport != null ?


                              Text(
                              airport.name,
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ) :
                            Text(
                              'Select airport',
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )

                            ;
                          }),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
