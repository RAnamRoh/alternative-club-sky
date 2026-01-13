import 'package:domain/repository/explore_repository.dart';
import 'package:club_alt/presentation/base/base_binding.dart';

import '../explore_view_model.dart';

class ExploreBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    ExploreRepository exploreRepository = await diModule.resolve<ExploreRepository>();
    return diModule.registerInstance(
      ExploreViewModel(repository: exploreRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<ExploreViewModel>();
  }

}
