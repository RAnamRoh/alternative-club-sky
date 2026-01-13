import 'package:domain/repository/sky_home_repository.dart';
import 'package:sky_club/presentation/base/base_binding.dart';
import 'package:sky_club/presentation/feature/skyhome/skyhome_view_model.dart';



class SkyhomeBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    SkyHomeRepository skyhomeRepository = await diModule.resolve<SkyHomeRepository>();
    return diModule.registerInstance(
      SkyhomeViewModel(repository: skyhomeRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<SkyhomeViewModel>();
  }
}
