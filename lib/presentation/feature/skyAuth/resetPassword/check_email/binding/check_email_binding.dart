import 'package:club_alt/presentation/base/base_binding.dart';

import '../check_email_view_model.dart';

class CheckEmailBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // CheckEmailRepository checkEmailRepository = await diModule.resolve<CheckEmailRepository>();
    return diModule.registerInstance(
      CheckEmailViewModel(),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<CheckEmailViewModel>();
  }
}
