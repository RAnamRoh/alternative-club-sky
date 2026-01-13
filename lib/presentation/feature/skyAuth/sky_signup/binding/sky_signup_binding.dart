import 'package:domain/repository/sky_auth_repository.dart';
import 'package:club_alt/presentation/base/base_binding.dart';

import '../sky_signup_view_model.dart';

class SkySignupBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // SkySignupRepository skySignupRepository = await diModule.resolve<SkySignupRepository>();
    SkyAuthRepository skyAuthRepository = await diModule.resolve<SkyAuthRepository>();
    return diModule.registerInstance(
      SkySignupViewModel(skyAuthRepository: skyAuthRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<SkySignupViewModel>();
  }
}
