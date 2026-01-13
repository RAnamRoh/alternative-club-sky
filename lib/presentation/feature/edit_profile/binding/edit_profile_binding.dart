import 'package:domain/repository/sky_auth_repository.dart';
import 'package:club_alt/presentation/base/base_binding.dart';
import 'package:club_alt/presentation/feature/edit_profile/edit_profile_view_model.dart';

class EditProfileBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // EditProfileRepository editProfileRepository = await diModule.resolve<EditProfileRepository>();
    SkyAuthRepository authRepository = await diModule.resolve<SkyAuthRepository>();
    return diModule.registerInstance(
      EditProfileViewModel(authRepository: authRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<EditProfileViewModel>();
  }
}
