import 'package:data/remote/response/booking/user_bookings_response.dart';
import 'package:domain/enum/status.dart';
import 'package:domain/model/skyClubModels/booking.dart';

class BookingMapper {
  static Booking mapUserBookingsResponseToBooking(
      UserBookingsResponse response) {
    // Extract the first journey (or handle multiple journeys as needed)
    final journey =
        response.journeys.isNotEmpty ? response.journeys.first : null;

    // Format the journey string
    final journeyString = journey != null
        ? '${journey.firstCityName} - ${journey.departureDate}\n${journey.lastCityName} - ${journey.arrivalDate}'
        : 'Unknown Journey';

    // Map the status string to the Status enum
    final status = _mapStatusStringToEnum(response.status);

    // Format the booking amount as a currency string
    final bookingAmount = 'AUD ${response.total.toStringAsFixed(2)}';

    return Booking(
      bookingId: response.bookingId,
      ticketId: response.pnr, // Assuming pnr is the ticket ID
      bookingAmount: bookingAmount,
      status: status,
      journey: journeyString,
    );
  }

  static List<Booking> mapUserBookingsResponseListToBookingList(
      List<UserBookingsResponse> responses) {
    return responses
        .map((response) =>
            BookingMapper.mapUserBookingsResponseToBooking(response))
        .toList();
  }

  // Helper function to map status string to Status enum
  static Status _mapStatusStringToEnum(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Status.completed;
      case 'requested':
        return Status.requested;
      case 'cancelled':
        return Status.canceled;
      case 'paid':
        return Status.paid;
      case 'cancelrequested':
        return Status.cancelRequested;

      default:
        return Status.requested; // Default to requested if status is unknown
    }
  }
}
