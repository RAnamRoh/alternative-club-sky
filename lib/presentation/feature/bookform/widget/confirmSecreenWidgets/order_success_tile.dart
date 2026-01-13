import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/bookform/bookform_view_model.dart';
import 'package:sky_club/presentation/feature/bookform/widget/flight_route_card.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class OrderSuccessTile extends StatelessWidget {
  final BookformViewModel viewModel;
  const OrderSuccessTile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return _buildTile(context);
  }

  Widget _buildcheckIcon() {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF12C278),
        ),
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: Dimens.dimen_72,
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {

    final String name = viewModel.bookingContactDetails.firstName;
    final String email = viewModel.bookingContactDetails.email;

    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20).copyWith(
        top: Dimens.dimen_55,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.dimen_10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$name, your order has submitted successfully!',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: Dimens.dimen_20,
                ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Your booking detaisl has been sent to: $email',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'To print your Booking, ',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'click here',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'Graphik',
                  fontSize: Dimens.dimen_16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimens.dimen_40),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none, // Allows the checkIcon to overflow outside of the container
        children: [
          _buildDetails(context),
          Positioned(
            top: -Dimens.dimen_40, // Adjust to position the checkIcon on top of the details card
            child: _buildcheckIcon(),
          ),
        ],
      ),
    );
  }


}
