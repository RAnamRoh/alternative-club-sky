import 'package:flutter/foundation.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/feature/skybase/reward/page/subscription_cancel/route/subscription_cancel_argument.dart';
import 'package:sky_club/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:sky_club/presentation/feature/skybase/route/skybase_route.dart';

class SubscriptionCancelViewModel extends BaseViewModel<SubscriptionCancelArgument> {


  SubscriptionCancelViewModel();

  @override
  void onViewReady({SubscriptionCancelArgument? argument}) {
    super.onViewReady();
  }

 void navigateHome(){
   navigateToScreen(destination: SkybaseRoute(arguments: SkybaseArgument()),isClearBackStack: true);
 }



}
