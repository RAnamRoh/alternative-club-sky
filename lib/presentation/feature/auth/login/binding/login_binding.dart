import 'package:domain/repository/auth_repository.dart';
import 'package:club_alt/presentation/base/base_binding.dart';
import 'package:club_alt/presentation/feature/auth/login/login_view_model.dart';

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
