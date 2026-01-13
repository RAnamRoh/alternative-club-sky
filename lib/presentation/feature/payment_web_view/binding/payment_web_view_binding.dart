import 'package:club_alt/presentation/base/base_binding.dart';
import 'package:club_alt/presentation/feature/bookform/bookform_view_model.dart';
import 'package:club_alt/presentation/feature/payment_web_view/payment_web_view_view_model.dart';

class PaymentWebViewBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    // PaymentWebViewRepository paymentWebViewRepository = await diModule.resolve<PaymentWebViewRepository>();

    return diModule.registerInstance(
      PaymentWebViewViewModel( ),
    );
  }

  @override
  Future<void> removeDependencies() async {
    // return diModule.unregister<PaymentWebViewViewModel>();
  }
}
