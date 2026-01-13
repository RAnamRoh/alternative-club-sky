import 'package:sky_club/presentation/base/base_binding.dart';

import '../destination_details_view_model.dart';

class DestinationDetailsBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // DestinationDetailsRepository destinationDetailsRepository = await diModule.resolve<DestinationDetailsRepository>();
    return diModule.registerInstance(
      DestinationDetailsViewModel(),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<DestinationDetailsViewModel>();
  }
}
