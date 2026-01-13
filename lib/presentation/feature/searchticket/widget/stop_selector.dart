import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_club/presentation/base/screen_util/screen_util_builder.dart';
import 'package:sky_club/presentation/feature/searchticket/searchticket_view_model.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class StopSelector extends StatelessWidget {

  final SearchticketViewModel viewModel;

  StopSelector({super.key, required this.viewModel});

  // ValueNotifier to track the selected stop
  //final ValueNotifier<int?> selectedStop = ValueNotifier<int?>(null);
  final ValueNotifier<Set<int>> selectedStops = ValueNotifier<Set<int>>({});

  // List of stops
  final List<int> stopOptions = [1, 2, 3, 4, 5]; // Number of stops to display

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stopOptions.length,
      shrinkWrap: true, // Prevents ListView from taking infinite height
      physics: const NeverScrollableScrollPhysics(), // Relies on parent scroll
      itemBuilder: (context, index) {
        final stop = stopOptions[index];

        return ValueListenableBuilder<Set<int>>(
          valueListenable: selectedStops,
          builder: (context, selectedStopValue, child) {
            final isSelected = selectedStopValue.contains(stop);

            return GestureDetector(
              onTap: () {
                // selectedStop.value = stop; // Update selected stop
                // _onStopSelected(stop);

                _toggleStopSelection(stop);
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
                    // Stop Label
                    Expanded(
                      child: Text(
                        stop == 1 ? "$stop Stop" : "$stop Stops",
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

  void _onStopSelected(int stop) {
    debugPrint('Selected Stop: $stop');
  }

  void _toggleStopSelection(int stop) {
    final updatedSelectedStop = Set<int>.from(selectedStops.value);
    if (updatedSelectedStop.contains(stop)) {
      updatedSelectedStop.remove(stop); // Deselect airline
    } else {
      updatedSelectedStop.add(stop); // Select airline
    }

    selectedStops.value = updatedSelectedStop;

    // Notify the ViewModel to filter flight tickets
   viewModel.updateSelectedStops(updatedSelectedStop.toList());
  }
}
