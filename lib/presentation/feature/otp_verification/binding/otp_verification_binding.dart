import 'package:domain/repository/sky_home_repository.dart';
import 'package:club_alt/presentation/base/base_binding.dart';
import 'package:club_alt/presentation/feature/otp_verification/otp_verification_view_model.dart';

class OtpVerificationBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // OtpVerificationRepository otpVerificationRepository = await diModule.resolve<OtpVerificationRepository>();
    SkyHomeRepository skyHomeRepository = await diModule.resolve<SkyHomeRepository>();
    return diModule.registerInstance(
      OtpVerificationViewModel(repository: skyHomeRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<OtpVerificationViewModel>();
  }
}
