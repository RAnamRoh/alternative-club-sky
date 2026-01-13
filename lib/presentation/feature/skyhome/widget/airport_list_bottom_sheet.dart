
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/skyhome/skyhome_view_model.dart';
import 'package:club_alt/presentation/util/debouncer.dart';

import 'airport_card.dart';

class AirportListBottomSheet extends StatelessWidget {
  final SkyhomeViewModel viewModel;
  final bool isDeparture;
  final bool isMultiCity;
  final int? journeyIndex ;
  const AirportListBottomSheet(
      {super.key, required this.viewModel, required this.isDeparture, required this.isMultiCity, this.journeyIndex });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 0.5,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            children: [
              TextField(
                onChanged: (query) {
                  Debouncer.debounce(milliseconds: 500, action: (){
                    viewModel.filterAirports(query);
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Search City',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: viewModel.filteredAirports,
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return AirportCard(
                          airport: value[index],
                          onTap: () {
                            if(isMultiCity){
                              if (isDeparture) {
                                viewModel.updateJourneySegment(journeyIndex!, departure: value[index]);
                                print(
                                    'Departure airport is ${viewModel.departureAirport.value?.city}');
                              } else {
                                viewModel.updateJourneySegment(journeyIndex!, arrival: value[index]);
                                print(
                                    'Arrival airport is ${viewModel.arrivalAirport.value?.city}');
                              }
                            }
                            else{
                              if (isDeparture) {
                                viewModel.updateDepartureAirport(value[index]);
                                print(
                                    'Departure airport is ${viewModel.departureAirport.value?.city}');
                              } else {
                                viewModel.updateArrivalAirport(value[index]);
                                print(
                                    'Arrival airport is ${viewModel.arrivalAirport.value?.city}');
                              }
                            }
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}