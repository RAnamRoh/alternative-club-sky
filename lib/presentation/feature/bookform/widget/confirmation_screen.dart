import 'package:domain/model/skyClubModels/search_flight_ticket.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/bookform/bookform_view_model.dart';
import 'package:club_alt/presentation/feature/bookform/widget/confirmSecreenWidgets/flight_summary.dart';
import 'package:club_alt/presentation/feature/bookform/widget/confirmSecreenWidgets/order_success_tile.dart';
import 'package:club_alt/presentation/feature/bookform/widget/flight_route_card.dart';
import 'package:club_alt/presentation/feature/bookform/widget/short_booking_summary.dart';
import 'package:club_alt/presentation/values/dimens.dart';



class ConfirmationScreen extends StatelessWidget {
  final BookformViewModel viewModel;

  const ConfirmationScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20),
      color: Colors.grey.shade200,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildSuccessTile(),
            SizedBox(height: Dimens.dimen_20,),
            _buildBookingSummary(context),
            SizedBox(height: Dimens.dimen_20,),
            _buildFlightSummary(context),
            SizedBox(height: Dimens.dimen_20,),
            _buildFlightPath(),
            SizedBox(height: Dimens.dimen_20,),
            _buildHomeButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessTile(){
    return OrderSuccessTile(viewModel: viewModel,);
  }

  Widget _buildBookingSummary(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.note_alt_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: Dimens.dimen_24,
            ),
            SizedBox(width: Dimens.dimen_12,),
            Text(
              'Booking Summary',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: Dimens.dimen_15,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.dimen_10,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimens.dimen_8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 2.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ShortBookingSummary(viewModel: viewModel),
        )
      ],
    );
  }

  Widget _buildFlightSummary(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.note_alt_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: Dimens.dimen_24,
            ),
            SizedBox(width: Dimens.dimen_12,),
            Text(
              'Flight Summary',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: Dimens.dimen_15,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.dimen_10,
        ),
        FlightSummary(ticket: viewModel.selectedFlight.value!,),
      ],
    );
  }

  Widget _buildFlightPath(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...viewModel.selectedFlight.value!.journeys.map((journey) => Padding(
          padding: EdgeInsets.only(
            bottom: Dimens.dimen_10,
          ),
          child: FlightRouteCard( journey: journey),
        )),
      ],
    );
  }

  Widget _buildHomeButton(BuildContext context){
    return ElevatedButton(
      onPressed: () {
        viewModel.onClickHome();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_24, vertical: Dimens.dimen_12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dimen_8),
        ),
        minimumSize: Size(double.infinity, 40),
      ),
      child: Text(
        'Go to the Home page',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: Dimens.dimen_16,
        ),
      ),
    );

  }


}