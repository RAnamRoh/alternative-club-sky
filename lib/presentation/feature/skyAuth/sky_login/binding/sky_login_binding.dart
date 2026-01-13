import 'package:domain/repository/sky_auth_repository.dart';
import 'package:club_alt/presentation/base/base_binding.dart';

import '../sky_login_view_model.dart';

class SkyLoginBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    SkyAuthRepository skyAuthRepository = await diModule.resolve<SkyAuthRepository>();
    return diModule.registerInstance(
      SkyLoginViewModel(skyAuthRepository: skyAuthRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<SkyAuthRepository>();
  }
}
