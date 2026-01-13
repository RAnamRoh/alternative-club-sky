import 'package:domain/enum/ticket_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:club_alt/presentation/base/screen_util/screen_util_builder.dart';
import 'package:club_alt/presentation/feature/searchticket/searchticket_view_model.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class SortBySelector extends StatelessWidget {


  final SearchticketViewModel viewModel;

  SortBySelector({super.key, required this.viewModel});

  // ValueNotifier to track the selected sort option
  final ValueNotifier<TicketFilter?> selectedSortOption = ValueNotifier<TicketFilter?>(null);

  // List of sort options
  final List<TicketFilter> sortOptions = TicketFilter.values.toList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sortOptions.length,
      shrinkWrap: true, // Prevents ListView from taking infinite height
      physics: const NeverScrollableScrollPhysics(), // Relies on parent scroll
      itemBuilder: (context, index) {
        final sortOption = sortOptions[index];

        return ValueListenableBuilder<TicketFilter?>(
          valueListenable: selectedSortOption,
          builder: (context, selectedOption, child) {
            final isSelected = sortOption == selectedOption;

            return GestureDetector(
              onTap: () {
                selectedSortOption.value = sortOption; // Update selected sort option
                _onSortOptionSelected(sortOption);
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
                    // Sort Option Label
                    Expanded(
                      child: Text(
                        sortOption.name,
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

  void _onSortOptionSelected(TicketFilter sortOption) {
    debugPrint('Selected Sort Option: $sortOption');
    viewModel.updateSortFilter(sortOption);
  }
}
