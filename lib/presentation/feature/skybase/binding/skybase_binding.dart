import 'package:sky_club/presentation/base/base_binding.dart';

import '../skybase_view_model.dart';

class SkybaseBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // SkybaseRepository skybaseRepository = await diModule.resolve<SkybaseRepository>();
    return diModule.registerInstance(
      SkybaseViewModel(),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<SkybaseViewModel>();
  }
}
