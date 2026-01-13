import 'package:domain/repository/sky_auth_repository.dart';
import 'package:sky_club/presentation/base/base_binding.dart';
import 'package:sky_club/presentation/feature/edit_profile/edit_profile_view_model.dart';

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
