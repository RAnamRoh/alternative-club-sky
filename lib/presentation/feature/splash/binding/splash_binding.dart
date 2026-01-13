import 'package:domain/repository/sky_auth_repository.dart';
import 'package:club_alt/presentation/base/base_binding.dart';
import 'package:club_alt/presentation/feature/splash/splash_view_model.dart';

class SplashBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // SplashRepository splashRepository = await diModule.resolve<SplashRepository>();
    SkyAuthRepository authRepository = await diModule.resolve<SkyAuthRepository>();

    return diModule.registerInstance(
      SplashViewModel(authRepository: authRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<SplashViewModel>();
  }
}
