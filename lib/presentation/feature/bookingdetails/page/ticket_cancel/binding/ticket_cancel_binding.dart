import 'package:sky_club/presentation/base/base_binding.dart';
import 'package:sky_club/presentation/feature/bookingdetails/page/ticket_cancel/ticket_cancel_view_model.dart';

class TicketCancelBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // TicketCancelRepository ticketCancelRepository = await diModule.resolve<TicketCancelRepository>();
    return diModule.registerInstance(
      TicketCancelViewModel(),
    );
  }

  @override
  Future<void> removeDependencies() async {
    // return diModule.unregister<TicketCancelViewModel>();
  }
}
