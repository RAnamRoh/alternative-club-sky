import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_ui_state.dart';
import 'package:sky_club/presentation/feature/cancel_booking/cancel_booking_view_model.dart';
import 'package:sky_club/presentation/feature/cancel_booking/widget/cancel_form.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class CancelBookingMobilePortrait extends StatefulWidget {
  final CancelBookingViewModel viewModel;
  final String bookingId;

  const CancelBookingMobilePortrait({required this.viewModel,required this.bookingId, super.key});

  @override
  State<StatefulWidget> createState() => CancelBookingMobilePortraitState();
}

class CancelBookingMobilePortraitState extends BaseUiState<CancelBookingMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking ID #${widget.bookingId}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
            fontSize: Dimens.dimen_16,
          ),
        ),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CancelForm(viewModel: widget.viewModel),
        _buildButtonSection(context),
      ],
    );
  }

  Widget _buildButtonSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20).copyWith(
        bottom: Dimens.dimen_30,
      ),
      width: double.infinity,
      color: Colors.white,
      child: _buildButtons(context),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              widget.viewModel.onDismissClicked();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFB9B9B9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.dimen_5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Reduced padding
              side: BorderSide(
                color: Color(0xFFB9B9B9),
                width: 1,
              ),
            ),
            child: FittedBox( // Ensures text scales down if necessary
              child: Text(
                'Discard',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: Dimens.dimen_14, // Adjusted font size
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: Dimens.dimen_10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              widget.viewModel.cancelBooking();

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.dimen_5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Reduced padding
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
            child: Text(
              'Cancel Now',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: Dimens.dimen_14, // Adjusted font size
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }




}
