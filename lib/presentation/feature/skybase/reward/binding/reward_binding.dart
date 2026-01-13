import 'package:domain/repository/reward_repository.dart';
import 'package:club_alt/presentation/base/base_binding.dart';

import '../reward_view_model.dart';

class RewardBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
     RewardRepository rewardRepository = await diModule.resolve<RewardRepository>();
    return diModule.registerInstance(
      RewardViewModel(repository: rewardRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<RewardViewModel>();
  }
}
