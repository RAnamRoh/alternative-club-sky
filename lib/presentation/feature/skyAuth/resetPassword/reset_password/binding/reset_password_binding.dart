import 'package:domain/repository/sky_auth_repository.dart';
import 'package:sky_club/presentation/base/base_binding.dart';

import '../reset_password_view_model.dart';

class ResetPasswordBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // ResetPasswordRepository resetPasswordRepository = await diModule.resolve<ResetPasswordRepository>();
    SkyAuthRepository skyAuthRepository = await diModule.resolve<SkyAuthRepository>();
    return diModule.registerInstance(
      ResetPasswordViewModel(skyAuthRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<ResetPasswordViewModel>();
  }
}
