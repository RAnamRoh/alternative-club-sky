import 'package:club_alt/presentation/base/base_binding.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/subscription_cancel_view_model.dart';

class SubscriptionCancelBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // SubscriptionCancelRepository subscriptionCancelRepository = await diModule.resolve<SubscriptionCancelRepository>();
    return diModule.registerInstance(
      SubscriptionCancelViewModel(),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<SubscriptionCancelViewModel>();
  }
}
