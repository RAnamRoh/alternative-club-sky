import 'package:domain/repository/sky_auth_repository.dart';
import 'package:club_alt/presentation/base/base_binding.dart';
import 'package:club_alt/presentation/feature/skybase/account/account_view_model.dart';

class AccountBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // AccountRepository accountRepository = await diModule.resolve<AccountRepository>();
    SkyAuthRepository authRepository = await diModule.resolve<SkyAuthRepository>();
    return diModule.registerInstance(
      AccountViewModel(authRepository: authRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<AccountViewModel>();
  }
}
