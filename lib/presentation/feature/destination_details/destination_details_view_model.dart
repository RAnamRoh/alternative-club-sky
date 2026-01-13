import 'package:flutter/foundation.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/feature/destination_details/route/destination_details_argument.dart';

class DestinationDetailsViewModel extends BaseViewModel<DestinationDetailsArgument> {

  final ValueNotifier<String> _message = ValueNotifier('DestinationDetails');

  ValueListenable<String> get message => _message;

  int count = 0;

  DestinationDetailsViewModel();

  @override
  void onViewReady({DestinationDetailsArgument? argument}) {
    super.onViewReady();
  }

  void onClick() {
     count++;
    _message.value = '${message.value}$count';
  }

}
