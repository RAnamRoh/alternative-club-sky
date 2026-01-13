import 'package:flutter/foundation.dart';
import 'package:sky_club/presentation/base/base_argument.dart';

class OtpVerificationArgument extends BaseArgument {
  // int id;
  // String name;
  //
  // HelloWorldArgument({required this.id, required this.name});

  final VoidCallback? onPOP;

  OtpVerificationArgument({this.onPOP});
}
