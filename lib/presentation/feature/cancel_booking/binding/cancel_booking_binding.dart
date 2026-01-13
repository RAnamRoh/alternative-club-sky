import 'package:domain/repository/booking_details_repository.dart';
import 'package:sky_club/presentation/base/base_binding.dart';
import 'package:sky_club/presentation/feature/cancel_booking/cancel_booking_view_model.dart';

class CancelBookingBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // CancelBookingRepository cancelBookingRepository = await diModule.resolve<CancelBookingRepository>();
    BookingDetailsRepository bookingdetailsRepository = await diModule.resolve<BookingDetailsRepository>();
    return diModule.registerInstance(
      CancelBookingViewModel(bookingRepository: bookingdetailsRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<CancelBookingViewModel>();
  }
}
