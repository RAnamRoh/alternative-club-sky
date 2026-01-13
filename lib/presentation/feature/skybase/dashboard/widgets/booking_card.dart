import 'package:domain/enum/status.dart';
import 'package:domain/model/skyClubModels/booking.dart';
import 'package:flutter/material.dart';

import '../../../../values/dimens.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;

  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                _buildInfoRow(context, 'Booking ID', booking.bookingId),
                _buildInfoRow(context, 'Ticket ID', booking.ticketId),
                _buildInfoRow(context, 'Booking Amount', booking.bookingAmount),
                _buildStatusRow(context, booking.status),
                _buildInfoRow(context, 'Journey', booking.journey),
              ],
            ),
          ),
          _buildDetailsButton(context),
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

  Widget _buildStatusRow(BuildContext context, Status status) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            'Status',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Color(0xFF4F4F4F),
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(5).copyWith(
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: status.backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status.name,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: status.foregroundColor,
                  ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailsButton(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xFFDCDEFF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      child: Center(
        child: Text(
          'Click to view details',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: Dimens.dimen_12,
              ),
        ),
      ),
    );
  }
}
