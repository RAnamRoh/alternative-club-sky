import 'package:data/local/shared_preference/entity/sky_user_shared_pref_entity.dart';
import 'package:data/sessionManager/user_session_manager.dart';
import 'package:domain/model/skyClubModels/sky_user.dart';
import 'package:domain/repository/sky_auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/feature/edit_profile/route/edit_profile_argument.dart';
import 'package:sky_club/presentation/feature/edit_profile/route/edit_profile_route.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/route/reset_password_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/route/reset_password_route.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/route/sky_login_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/route/sky_login_route.dart';
import 'package:sky_club/presentation/feature/skybase/account/route/account_argument.dart';
import 'package:sky_club/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:sky_club/presentation/feature/skybase/route/skybase_route.dart';

class AccountViewModel extends BaseViewModel<AccountArgument> {





  ValueNotifier<SkyUser?> user = ValueNotifier(null);

  final SkyAuthRepository authRepository;

  AccountViewModel({required this.authRepository});

  @override
  void onViewReady({AccountArgument? argument}) {

    super.onViewReady();

    getUser();

  }



  void onClickEditProfile() {

    if (user.value != null) {
      navigateToScreen(destination: EditProfileRoute(arguments: EditProfileArgument(user: user.value! )),);
    }

  }

  void onClickChangePassword(){
    navigateToScreen(destination: ResetPasswordRoute(arguments: ResetPasswordArgument()));
  }

  Future<void> getUser() async {

    //final entity = await SkyUserSharedPrefEntity.example.getFromSharedPref() as SkyUserSharedPrefEntity;

    user.value = await UserSessionManager().getCurrentUser();

  }

  void onClickLogout() async {
    await authRepository.logout();
    navigateToScreen(destination: SkybaseRoute(arguments: SkybaseArgument()), isClearBackStack: true);
  }

}
