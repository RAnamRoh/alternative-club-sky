import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_club/presentation/base/screen_util/screen_util_builder.dart';
import 'package:sky_club/presentation/feature/searchticket/searchticket_view_model.dart';
import 'package:sky_club/presentation/feature/searchticket/widget/airline_selector.dart';
import 'package:sky_club/presentation/feature/searchticket/widget/sort_by_selector.dart';
import 'package:sky_club/presentation/feature/searchticket/widget/stop_selector.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class FilterSheet extends StatelessWidget {
  final SearchticketViewModel viewModel;

  const FilterSheet({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: [
          MaterialButton(
            onPressed: () {
              viewModel.resetFilters();
              Navigator.pop(context);
            },
            padding: EdgeInsets.all(Dimens.dimen_10),
            child: Row(
              children: [
                Icon(Icons.no_drinks_outlined),
                SizedBox(
                  width: Dimens.dimen_10,
                ),
                Text('Clear Filters')
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAirlineList(context),
            _buildStopList(context),
            _buildSortList(context),
            _buildButtonRow(context, () {
              Navigator.pop(context);
            }, () async {
              await viewModel.applyFilter();
              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }

  Widget _buildAirlineList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AIRLINES',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          AirlineSelector(
            viewModel: viewModel,
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildStopList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'STOPS',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          StopSelector(
            viewModel: viewModel,
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildSortList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SORT BY',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          SortBySelector(
            viewModel: viewModel,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(
      BuildContext context, VoidCallback? onCancel, VoidCallback? onApply) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
        bottom: 30,
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onCancel,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: Dimens.dimen_10.r, horizontal: Dimens.dimen_20.r),
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.dimen_6.r),
                ),
              ),
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimens.dimen_18.sp,
                ),
              ),
            ),
          ),
          SizedBox(
            width: Dimens.dimen_10.w,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: onApply,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: Dimens.dimen_10.r, horizontal: Dimens.dimen_20.r),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child:  Text(
                "Apply Filter",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimens.dimen_18.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
