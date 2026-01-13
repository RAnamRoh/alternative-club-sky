import 'package:domain/repository/sky_auth_repository.dart';
import 'package:sky_club/presentation/base/base_binding.dart';

import '../email_for_reset_view_model.dart';

class EmailForResetBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // EmailForResetRepository emailForResetRepository = await diModule.resolve<EmailForResetRepository>();
    SkyAuthRepository skyAuthRepository = await diModule.resolve<SkyAuthRepository>();
    return diModule.registerInstance(
      EmailForResetViewModel(skyAuthRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<EmailForResetViewModel>();
  }
}
