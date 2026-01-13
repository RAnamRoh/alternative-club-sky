import 'package:domain/model/skyClubModels/baggage_fare_model.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/common/clipper/booingDetailsBody_clipper.dart';
import 'package:sky_club/presentation/common/clipper/bookingDetailHeader_clipper.dart';


import '../../../values/dimens.dart';

class BagDetailTile extends StatelessWidget {

  final BaggageFareModel model;

  const BagDetailTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return _buildCard(context);
  }

  Widget _buildCard(BuildContext context) {
    return 
    //   ClipPath(
    //   clipper: BagAndOtherClipper(),
    //   child: Container(
    //     width: 335,
    //     margin: EdgeInsets.symmetric(vertical: Dimens.dimen_10),
    //     child: Column(
    //       children: [
    //         _buildHeader(context),
    //         _buildNameAndAllowance(context),
    //         _buildDetails(context),
    //       ],
    //     ),
    //   ),
    // );
    
    Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.dimen_10),
      child: Column(
        children: [
          ClipPath(
            clipper: BookingDetailHeaderClipper(),
            child: Column(
              children: [
                _buildHeader(context),
                _buildNameAndAllowance(context),
              ],
            ),
          ),
          ClipPath(
            clipper: BookingDetailBodyClipper(),
            child: _buildDetails(context),
          )
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_20, vertical: Dimens.dimen_12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.dimen_10),
          topRight: Radius.circular(Dimens.dimen_10),
        ),
      ),
      child: Row(
        children: [
          Text(
            'PAX. NAME',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Spacer(),
          Text(
            'BAG. ALLOWANCE',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameAndAllowance(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20, vertical: Dimens.dimen_10),
      color: Color(0xFFE9E6FF),
      child: Column(
        children: List.generate(
            model.passengers.length,
                (index) => _buildNameRow(context, model.passengers[index].name, model.passengers[index].bagAllowance)
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20, vertical: Dimens.dimen_30),
      color: Colors.white,
      child: Column(
        children: [
          _buildInfoRow(context, 'Trip segment', model.tripSegment, true),
          _buildInfoRow(context, 'Pax. type', model.paxType, false),
          _buildInfoRow(context, 'Fare code', model.fareCode, false),
          _buildInfoRow(context, 'Currency', model.currency, false),
          _buildInfoRow(context, 'Base fare', model.baseFare.toString(), false),
          _buildInfoRow(context, 'Ticket fare', model.ticketFare.toString(), false),
          _buildInfoRow(context, 'Total fare', 'AU \$${model.totalFare}', false),
        ],
      ),
    );
  }


  Widget _buildNameRow(BuildContext context, String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }


  Widget _buildInfoRow(BuildContext context, String title, String value, bool isBold) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Color(0xFF4F4F4F),
            ),
          ),
          Spacer(),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isBold ? Colors.black : Color(0xFF4F4F4F),
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
            ),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }

}
