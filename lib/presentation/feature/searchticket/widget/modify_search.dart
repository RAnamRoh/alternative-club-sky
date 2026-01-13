import 'package:domain/enum/travel_way.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/searchticket/searchticket_view_model.dart';

class ModifySearch extends StatelessWidget {

  final SearchticketViewModel viewModel;

  const ModifySearch({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildWaySelector(context),
          _buildBody(context),
        ],
      )
    );
  }



  Widget _buildWaySelector(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ValueListenableBuilder(
        valueListenable: viewModel.selectedWay,
        builder: (context, selectedWay,_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWayButton(
                context: context,
                travelWay: TravelWay.oneWay,
                isSelected: selectedWay == TravelWay.oneWay,
                onTap: () {
                  viewModel.updateSelectedWay(TravelWay.oneWay);
                },
              ),
              Spacer(),
              _buildWayButton(
                context: context,
                travelWay: TravelWay.roundTrip,
                isSelected: selectedWay == TravelWay.roundTrip,
                onTap: () {
                  viewModel.updateSelectedWay(TravelWay.roundTrip);
                },
              ),
              Spacer(),
              _buildWayButton(
                context: context,
                travelWay: TravelWay.multiCity,
                isSelected: selectedWay == TravelWay.multiCity,
                onTap: () {
                  viewModel.updateSelectedWay(TravelWay.multiCity);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWayButton({
    required BuildContext context,
    required TravelWay travelWay,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFF110A7A) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(
                travelWay.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight:
                  isSelected ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context){
    return Column(
      children: [
        _dividedContainer(context, "FROM", "Sydney", "TO", "New York"),
        _dividedContainer(context, "JOURNEY DAY", "12/12/2023", "RETURN DATE", "12/12/2023"),
        _dividedContainer(context, "CLASS", "Business", "SEAT", "2"),
      ],
    );
  }

  Widget _dividedContainer(BuildContext context, String title1, String value1, String title2, String value2){
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: EdgeInsets.symmetric(vertical: 5),
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
          Expanded(
            child: _buildDataColumn(context, title1, value1),
          ),
          const SizedBox(
              height: 70, // Specify height for the divider
              child: VerticalDivider(
                color: Colors.grey, // Divider color
                thickness: 1, // Divider thickness
                width: 16, // Space taken by the divider
              )),
          Expanded(
            child: _buildDataColumn(context, title2 , value2),
          ),
        ],
      ),
    );
  }

  Widget _buildDataColumn(BuildContext context, String title, String value){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        ),
        Text(value,
        style: TextStyle(
          color: Color(0xFF110A7A),
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        ),
      ],
    );
  }



}


