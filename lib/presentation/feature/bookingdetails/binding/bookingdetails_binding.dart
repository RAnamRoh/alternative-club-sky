import 'package:domain/repository/booking_details_repository.dart';
import 'package:sky_club/presentation/base/base_binding.dart';

import '../bookingdetails_view_model.dart';

class BookingdetailsBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    BookingDetailsRepository bookingdetailsRepository = await diModule.resolve<BookingDetailsRepository>();
    return diModule.registerInstance(
      BookingdetailsViewModel(repository: bookingdetailsRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<BookingdetailsViewModel>();
  }
}
