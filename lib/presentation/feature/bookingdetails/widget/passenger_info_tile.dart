import 'package:domain/model/skyClubModels/passenger_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_club/presentation/common/clipper/booingDetailsBody_clipper.dart';
import 'package:sky_club/presentation/common/clipper/bookingDetailHeader_clipper.dart';
import 'package:sky_club/presentation/values/dimens.dart';





class PassengerInfoTile extends StatelessWidget {

  final PassengerInfoModel model;

  const PassengerInfoTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return _buildCard(context);
  }


  Widget _buildCard(BuildContext context) {
    return 
    //   ClipPath(
    //   clipper: PassengerClipper(),
    //   child: Container(
    //     width: 335,
    //     margin: EdgeInsets.symmetric(vertical: Dimens.dimen_10),
    //     child: Column(
    //       children: [
    //         _buildNameAndTicket(context),
    //         _buildInfo(context),
    //       ],
    //     ),
    //   ),
    // );
    
    Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.dimen_10.h),
      child: Column(
        children: [
          ClipPath(
            clipper: BookingDetailHeaderClipper(),
            child: Container(
              child: _buildNameAndTicket(context),
            ),
          ),
          ClipPath(
            clipper: BookingDetailBodyClipper(),
            child: Container(
              child: _buildInfo(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNameAndTicket(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      padding: EdgeInsets.all(Dimens.dimen_10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.dimen_10),
          topRight: Radius.circular(Dimens.dimen_10),
        ),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        children: [
          Text(
            model.name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
            ),
          ),
          Text(
            'TICKET NUMBER: ${model.ticketNumber}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontSize: Dimens.dimen_12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_20, vertical: Dimens.dimen_30),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          _buildInfoRow(context, 'SSR Code', model.ssrCode),
          _buildInfoRow(context, 'Pax. type', model.paxType),
          _buildInfoRow(context, 'Contact', model.contact),
          _buildInfoRow(context, 'Passport No.', model.passportNo),
        ],
      ),
    );
  }
  Widget _buildInfoRow(BuildContext context, String title, String value) {
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
              color: Color(0xFF4F4F4F),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }




}
