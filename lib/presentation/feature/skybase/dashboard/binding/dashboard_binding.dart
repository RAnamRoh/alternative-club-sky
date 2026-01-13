import 'package:domain/repository/booking_details_repository.dart';
import 'package:club_alt/presentation/base/base_binding.dart';

import '../dashboard_view_model.dart';

class DashboardBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // DashboardRepository dashboardRepository = await diModule.resolve<DashboardRepository>();
    BookingDetailsRepository bookingDetailsRepository = await diModule.resolve<BookingDetailsRepository>();
    return diModule.registerInstance(
      DashboardViewModel(bookingRepository: bookingDetailsRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<DashboardViewModel>();
  }
}
