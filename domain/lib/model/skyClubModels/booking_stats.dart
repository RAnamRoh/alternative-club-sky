
import 'package:data/remote/response/booking/user_bookings_response.dart';

class BookingStats {
  final int totalBookings;
  final int pendingBookings;
  final int cancelledBookings;

  BookingStats({
    required this.totalBookings,
    required this.pendingBookings,
    required this.cancelledBookings,
  });

  static BookingStats calculateStats(List<UserBookingsResponse> bookings) {
    int totalBookings = bookings.length;
    int pendingBookings = 0;
    int cancelledBookings = 0;

    for (var booking in bookings) {
      if (booking.status.toLowerCase() == 'requested') {
        pendingBookings++;
      } else if (booking.status.toLowerCase() == 'cancelled') {
        cancelledBookings++;
      }
    }

    return BookingStats(
      totalBookings: totalBookings,
      pendingBookings: pendingBookings,
      cancelledBookings: cancelledBookings,
    );
  }


}