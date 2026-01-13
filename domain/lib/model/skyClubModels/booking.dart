import '../../enum/status.dart';

class Booking {
  final String bookingId;
  final String ticketId;
  final String bookingAmount;
  final Status status;
  final String journey;

  Booking(
      {required this.bookingId,
      required this.ticketId,
      required this.bookingAmount,
      required this.status,
      required this.journey});

  static List<Booking> dummyBookings = [
    Booking(
        bookingId: '#XYZ2334',
        ticketId: '#AZ2335',
        bookingAmount: 'AUD 689.00',
        status: Status.completed,
        journey: 'Dubai - Mon 24 Jun 24\nLondon - Tue 24 Jun 24'),
    Booking(
        bookingId: '#XYZ2332',
        ticketId: '#AZ2332',
        bookingAmount: 'AUD 689.00',
        status: Status.requested,
        journey: 'Dubai - Mon 24 Jun 24\nLondon - Tue 24 Jun 24'),
    Booking(
        bookingId: '#XYZ2331',
        ticketId: '#AZ2331',
        bookingAmount: 'AUD 689.00',
        status: Status.canceled,
        journey: 'Dubai - Mon 24 Jun 24\nLondon - Tue 24 Jun 24'),
  ];
}
