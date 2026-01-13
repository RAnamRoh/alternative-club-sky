import 'package:data/sessionManager/user_session_manager.dart';
import 'package:domain/repository/sky_auth_repository.dart';

import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_login/route/sky_login_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_login/route/sky_login_route.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_route.dart';
import 'package:club_alt/presentation/feature/splash/route/splash_argument.dart';

class SplashViewModel extends BaseViewModel<SplashArgument> {


  final SkyAuthRepository authRepository;

  SplashViewModel({required this.authRepository});

  @override
  void onViewReady({SplashArgument? argument}) {
    super.onViewReady();

    _initData();
  }



  Future<void> _initData() async {
    await UserSessionManager().initializeSharedPreferences();
    await Future.delayed(const Duration(seconds: 1));


    if (UserSessionManager().needLogin) {
      // No valid session, navigate to login
      // navigateToScreen(
      //   destination: SkyLoginRoute(arguments: SkyLoginArgument()),
      //   isClearBackStack: true,
      // );
      navigateToScreen(
        destination: SkybaseRoute(arguments: SkybaseArgument()),
        isClearBackStack: true,
      );
    } else {
      // Check if the token is expired and refresh it if necessary
      final bool isTokenValid = await UserSessionManager().refreshTokenIfExpired();

      if (isTokenValid) {
        // Token is valid or refreshed successfully, navigate to home
        navigateToScreen(
          destination: SkybaseRoute(arguments: SkybaseArgument()),
          isClearBackStack: true,
        );
      } else {
        // Token refresh failed, navigate to login
        await UserSessionManager().logout();
        // navigateToScreen(
        //   destination: SkyLoginRoute(arguments: SkyLoginArgument()),
        //   isClearBackStack: true,
        // );
        navigateToScreen(
          destination: SkybaseRoute(arguments: SkybaseArgument()),
          isClearBackStack: true,
        );
      }
    }
  }

}
