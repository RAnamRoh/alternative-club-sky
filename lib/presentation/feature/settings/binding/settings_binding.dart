import 'package:sky_club/presentation/app/app_viewmodel.dart';
import 'package:sky_club/presentation/base/base_binding.dart';
import 'package:sky_club/presentation/feature/settings/settings_view_model.dart';

class SettingsBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    AppViewModel appViewModel = await diModule.resolve<AppViewModel>();
    return diModule.registerInstance(
      SettingsViewModel(
        appViewModel: appViewModel,
      ),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<SettingsViewModel>();
  }
}
