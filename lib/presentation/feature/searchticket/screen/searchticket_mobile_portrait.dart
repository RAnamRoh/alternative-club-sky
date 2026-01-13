import 'dart:math';

import 'package:domain/enum/seat_class.dart';
import 'package:domain/model/skyClubModels/airport.dart';
import 'package:domain/model/skyClubModels/search_flight_details.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/feature/searchticket/searchticket_view_model.dart';
import 'package:club_alt/presentation/feature/searchticket/widget/filter_sheet.dart';
import 'package:club_alt/presentation/feature/searchticket/widget/modify_search.dart';
import 'package:club_alt/presentation/feature/searchticket/widget/ticket_tile.dart';
import 'package:club_alt/presentation/util/date_to_string.dart';
import 'package:club_alt/presentation/values/dimens.dart';

import '../widget/flight_path_painter.dart';

class SearchticketMobilePortrait extends StatefulWidget {
  final SearchFlightDetails flightDetails;

  final SearchticketViewModel viewModel;

  const SearchticketMobilePortrait(
      {required this.viewModel, super.key, required this.flightDetails});

  @override
  State<StatefulWidget> createState() => SearchticketMobilePortraitState();
}

class SearchticketMobilePortraitState
    extends BaseUiState<SearchticketMobilePortrait> {
  bool showModifySearch = false;

  ValueNotifier<bool> _showFilterSheet = ValueNotifier(false);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _showFilterSheet.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          _buildHeader(context),
           SizedBox(
            height: Dimens.dimen_10,
          ),
          valueListenableBuilder(
              listenable: widget.viewModel.filteredTicketList,
              builder: (context, value) {
                return Expanded(
                  child: 
                  ListView.builder(
                    itemCount: value.length, // Number of items in the list
                    itemBuilder: (BuildContext context, int index) {
                      return
                        TicketTile(
                        ticket: value[index],
                        viewModel: widget.viewModel,
                      );
                    },
                  ),
                );
              }),

          //TicketDetails()
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      title: Text("Select Flight",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              )),
      actions: [
        ValueListenableBuilder(
            valueListenable: _showFilterSheet,
            builder: (context, value, child) {
              return IconButton(
                icon: const Icon(Icons.filter_alt_rounded),
                onPressed: () {
                  _showFilterSheet.value = !_showFilterSheet.value;

                  if (_showFilterSheet.value) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20), // Top corners rounded
                        ),
                      ),
                      builder: (BuildContext context) {
                        return FractionallySizedBox(
                          heightFactor: 0.8, // Set height to 80% of the screen
                          child: FilterSheet(viewModel: widget.viewModel,),
                        );
                      },
                    ).whenComplete(() {
                      _showFilterSheet.value = false;
                    });
                  }
                },
              );
            }),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20).copyWith(
            bottom: 40,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child:  _buildFlightDetail(context),
        ),
        Transform(
          transform: Matrix4.translationValues(0, -25, 0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text("Modify Search",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Dimens.dimen_18,
                    )),
          ),
        ),
      ],
    );
  }

  Widget _buildFlightDetail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _airport(
            airport: widget.flightDetails.departureAirport,
            date: widget.flightDetails.departureDate,
            isDeparture: true),
        _flightPathDetails(),
        _airport(
            airport: widget.flightDetails.arrivalAirport,
            date: widget.flightDetails.returnDate ,
            isDeparture: false),
      ],
    );
  }

  Widget _airport(
      {required Airport airport,
       DateTime? date,
      required bool isDeparture}) {
    return Column(
      crossAxisAlignment:
          isDeparture ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          airport.city,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: Dimens.dimen_12,
              ),
        ),
        Text(
          airport.code,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        Text(
          date != null ? DateToString.dateToCompactString(date) : '',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: Dimens.dimen_12,
              ),
        ),
      ],
    );
  }

  Widget _drawFlightPath() {
    return Column(
      children: [
        CustomPaint(
          size: Size(120, 80),
          painter: FlightPathPainter(),
        ),
        Transform(
          transform: Matrix4.translationValues(0, -80, 0),
          child: Transform.rotate(
            angle: pi / 2,
            child: const Icon(
              Icons.airplanemode_active,
              color: Color(0xFF110A7A),
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _flightPathDetails() {
    return Column(
      children: [
        const AssetImageView(fileName: 'flightPath.svg'),
        // _drawFlightPath(),

        Text(
          '${widget.flightDetails.numberOfPassengers} ${widget.flightDetails.numberOfPassengers > 1 ? 'seats' : 'seat'} - ${widget.flightDetails.seatClass.seatName}',
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
