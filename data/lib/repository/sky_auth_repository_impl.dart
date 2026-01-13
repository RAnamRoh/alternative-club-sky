
import 'dart:io';

import 'package:data/local/shared_preference/entity/sky_auth_shared_pref_entity.dart';
import 'package:data/local/shared_preference/entity/sky_user_shared_pref_entity.dart';
import 'package:data/remote/api_service/auth_api_service.dart';
import 'package:data/remote/request/sign_up_request.dart';
import 'package:data/remote/response/auth/login_response.dart';
import 'package:data/remote/response/auth/media_upload_response.dart';
import 'package:data/remote/response/auth/user_response.dart';
import 'package:data/sessionManager/user_session_manager.dart';
import 'package:domain/model/skyClubModels/sky_user.dart';
import 'package:domain/repository/sky_auth_repository.dart';

class SkyAuthRepositoryImpl implements SkyAuthRepository {

  final AuthApiService skyAuthApiService;

  SkyAuthRepositoryImpl({required this.skyAuthApiService});


  @override
  Future<void> login({required String email, required String password}) async{

     final TokenResponse response = await skyAuthApiService.login(email, password);

     final SkyAuthSharedPrefEntity authDetails = SkyAuthSharedPrefEntity(
       accessToken: response.accessToken,
       refreshToken: response.refreshToken,
       expiresIn: DateTime.now().millisecondsSinceEpoch ~/ 1000 + response.expiresIn,
     );

     await UserSessionManager().saveTokens(authEntity: authDetails);

    // await authDetails.saveToSharedPref();

     final UserResponse userResponse = await skyAuthApiService.getCurrentUser();

     final SkyUserSharedPrefEntity userDetails =
     userResponse.toSkyUserSharedPrefEntity();

     await UserSessionManager().saveUser(userEntity: userDetails);

    // await userDetails.saveToSharedPref();


  }

  @override
  Future<void> signUp({required SignUpRequest request}) async {

    await skyAuthApiService.signUp(request);

  }

  @override
  Future<bool> logout() async{
    // await SkyUserSharedPrefEntity.example.deleteFromSharedPref();
    // await SkyAuthSharedPrefEntity.example.deleteFromSharedPref();
    await UserSessionManager().logout();
    return true;
  }

  @override
  Future<void> refreshToken({required String accessToken, required String refreshToken}) async {
    final TokenResponse response = await skyAuthApiService.refreshToken(accessToken: accessToken, refreshToken: refreshToken);

    final SkyAuthSharedPrefEntity authDetails = SkyAuthSharedPrefEntity(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      expiresIn: DateTime.now().millisecondsSinceEpoch ~/ 1000 + response.expiresIn,
    );

    await UserSessionManager().saveTokens(authEntity: authDetails);

    UserSessionManager().initializeSharedPreferences();
  }

  @override
  Future<void> updateUser({required SkyUser user}) async{



    final UserResponse response = await skyAuthApiService.updateUser(userResponse: user.toUserResponse());

    final SkyUserSharedPrefEntity userDetails =
    response.toSkyUserSharedPrefEntity();

    await UserSessionManager().saveUser(userEntity: userDetails);

  }

  @override
  Future<void> uploadMedia({required File imageFile}) async {
    final MediaUploadResponse response = await skyAuthApiService.uploadMedia(imageFile);
  }

  @override
  Future<void> forgotPassword({required String email}) async {

    await skyAuthApiService.forgotPassword(email: email);
  }

  @override
  Future<void> changePassword({required String currentPassword, required String newPassword}) async {
    await skyAuthApiService.changePassword(oldPassword: currentPassword, newPassword: newPassword);
  }


}