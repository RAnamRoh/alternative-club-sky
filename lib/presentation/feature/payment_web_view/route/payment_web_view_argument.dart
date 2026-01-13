import 'package:domain/enum/redirect_page.dart';
import 'package:sky_club/presentation/base/base_argument.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/feature/bookform/bookform_view_model.dart';

class PaymentWebViewArgument extends BaseArgument {
  // int id;
  // String name;
  //
  // HelloWorldArgument({required this.id, required this.name});
  final String checkoutUrl;
  final RedirectPage redirectUrl;
  final BookformViewModel? viewModel;

  PaymentWebViewArgument({required this.checkoutUrl, required this.redirectUrl,  this.viewModel});
}
