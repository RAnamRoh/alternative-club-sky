import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/feature/bookingdetails/page/ticket_cancel/ticket_cancel_view_model.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class TicketCancelMobilePortrait extends StatefulWidget {
  final TicketCancelViewModel viewModel;

  const TicketCancelMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => TicketCancelMobilePortraitState();
}

class TicketCancelMobilePortraitState
    extends BaseUiState<TicketCancelMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimens.dimen_20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildImage(context),
          _buildTitle(context),
          SizedBox(height: Dimens.dimen_8),
          _buildDescription(context),
          SizedBox(height: Dimens.dimen_24),
          _buildButton(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return const AssetImageView(fileName: 'stop.svg');
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Your Flight Booking Has Been Cancelled',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: Dimens.dimen_18,
          ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.viewModel.flightInfo,
        builder: (context, value, child) {
          return Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: 'Your booking for flight ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
              children: [
                TextSpan(
                  text: '${value.flightNumber} ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                  )
                ),
                TextSpan(
                  text: 'from ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                  )
                ),
                TextSpan(
                  text: '${value.departureCity} ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                  )
                ),
                TextSpan(
                  text: 'to ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                  )
                ),
                TextSpan(
                  text: '${value.arrivalCity} ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'on ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                  )
                ),
                TextSpan(
                  text: '${value.departureDate} ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                  )
                ),
                TextSpan(
                  text: 'has been cancelled. ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                  )
                ),
                TextSpan(
                  text: 'The refund will be processed within ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                  )
                ),
                TextSpan(
                  text: '[]',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                  )
                ),
              ],
            ),
          );
        });
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        widget.viewModel.navigateToHome();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.dimen_24, vertical: Dimens.dimen_12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dimen_8),
        ),
        minimumSize: Size(double.infinity, 40),
      ),
      child: Text(
        'Back To Home',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: Dimens.dimen_14,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}
