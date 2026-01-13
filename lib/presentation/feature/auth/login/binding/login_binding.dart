import 'package:domain/repository/auth_repository.dart';
import 'package:sky_club/presentation/base/base_binding.dart';
import 'package:sky_club/presentation/feature/auth/login/login_view_model.dart';

class LoginBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    AuthRepository authRepository = await diModule.resolve<AuthRepository>();
    return diModule.registerInstance(
      LoginViewModel(authRepository: authRepository),
    );
  }

  @override
  Future<void> removeDependencies() {
    return diModule.unregister<LoginViewModel>();
  }
}
