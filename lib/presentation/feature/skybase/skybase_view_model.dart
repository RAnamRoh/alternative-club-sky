import 'package:data/sessionManager/user_session_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_login/route/sky_login_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_login/route/sky_login_route.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:club_alt/presentation/feature/skybase/sky_bottom_navigation_item_type.dart';


class SkybaseViewModel extends BaseViewModel<SkybaseArgument> {

  final List<SkyNavigationItemType> navigationItems = SkyNavigationItemType.values;

 // static const int initialPageIndex = 0;
  static const int homeIndex = 0;

  // final ValueNotifier<int> _currentPageIndex = ValueNotifier(initialPageIndex);
  final ValueNotifier<int> _currentPageIndex = ValueNotifier(homeIndex);

  ValueListenable<int> get currentPageIndex => _currentPageIndex;

  final PageController pageController = PageController();

  SkybaseViewModel();

  @override
  void onViewReady({SkybaseArgument? argument}) {
    super.onViewReady();
    //_initData();
  }


  void onPageChanged(int index) {
    _currentPageIndex.value = index;
  }



  // void onNavigationItemClicked(int index) {
  //
  //
  //   _currentPageIndex.value = index;
  // }
  Future<void> onNavigationItemClicked( int index) async  {

    await UserSessionManager().initializeSharedPreferences();
    final bool needLogin =  UserSessionManager().needLogin;

    if (needLogin && index != homeIndex) {
      showSessionErrorDialogue(Icons.account_circle_outlined, 'Please Login To Continue', 'Login', (){
        navigateToScreen(destination: SkyLoginRoute(arguments: SkyLoginArgument()));
      });
      return;
    }

    if (_currentPageIndex.value != index) {
      _currentPageIndex.value = index;
      pageController.jumpToPage(index);
    }
  }

  void backOnBasePressed(){
    if(_currentPageIndex.value != homeIndex){
      _currentPageIndex.value = homeIndex;
      pageController.jumpToPage(homeIndex);
    }
  }

}
