import 'package:domain/model/skyClubModels/airline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_club/presentation/base/screen_util/screen_util_builder.dart';
import 'package:sky_club/presentation/feature/searchticket/searchticket_view_model.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class AirlineSelector extends StatelessWidget {
  final SearchticketViewModel viewModel;
  AirlineSelector({super.key,required this.viewModel });



  // ValueNotifier to track the selected airline codes
  final ValueNotifier<Set<String>> selectedAirlineCodes = ValueNotifier<Set<String>>({});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.airlineList.value.length,//AirlineDomain.dummyData.length,
      shrinkWrap: true, // Prevents ListView from taking infinite height
      physics: const NeverScrollableScrollPhysics(), // Relies on parent scroll
      itemBuilder: (context, index) {
        final airline = viewModel.airlineList.value[index];//AirlineDomain.dummyData[index];

        return ValueListenableBuilder<Set<String>>(
          valueListenable: selectedAirlineCodes,
          builder: (context, selectedCodes, child) {
            final isSelected = selectedCodes.contains(airline.code);

            return GestureDetector(
              onTap: () {
                _toggleAirlineSelection(airline);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.grey.shade100 : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey.shade300,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        airline.logo_url,
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return const Icon(
                            Icons.airplanemode_inactive,
                            size: 30,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 16),
                    // Airline Name
                    Expanded(
                      child: Text(
                        airline.name,
                        style:  TextStyle(
                          fontSize: Dimens.dimen_16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // Checkmark Icon
                    if (isSelected)
                      const Icon(
                        Icons.check,
                        color: Colors.black,
                        size: 24,
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _toggleAirlineSelection(AirlineDomain airline) {
    final updatedSelectedCodes = Set<String>.from(selectedAirlineCodes.value);
    if (updatedSelectedCodes.contains(airline.code)) {
      updatedSelectedCodes.remove(airline.code); // Deselect airline
    } else {
      updatedSelectedCodes.add(airline.code); // Select airline
    }

    selectedAirlineCodes.value = updatedSelectedCodes;

    // Notify the ViewModel to filter flight tickets
    viewModel.updateSelectedAirlines(updatedSelectedCodes.toList());
  }
}


