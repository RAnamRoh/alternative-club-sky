import 'package:domain/model/skyClubModels/booking.dart';
import 'package:domain/model/skyClubModels/booking_stats.dart';

class BookingListAndStats {
  final List<Booking> bookingList;
  final BookingStats bookingStats;


  BookingListAndStats({required this.bookingList, required this.bookingStats});

}