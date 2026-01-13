import 'package:data/local/shared_preference/entity/sky_auth_shared_pref_entity.dart';
import 'package:data/local/shared_preference/entity/sky_user_shared_pref_entity.dart';
import 'package:data/remote/api_client/sky_club_api_client.dart';
import 'package:data/remote/api_service/auth_api_service.dart';
import 'package:data/remote/api_service/auth_api_service_impl.dart';
import 'package:data/remote/response/auth/login_response.dart';
import 'package:data/remote/response/auth/user_response.dart';
import 'package:domain/model/skyClubModels/sky_user.dart';


class UserSessionManager {
  static final UserSessionManager _instance = UserSessionManager._internal();
  factory UserSessionManager() => _instance;
  UserSessionManager._internal();

  SkyAuthSharedPrefEntity? _authEntity;
  SkyUserSharedPrefEntity? _userEntity;
  AuthApiService apiService = AuthApiServiceImpl(apiClient: SkyClubApiClient());

  Future<void> initializeSharedPreferences() async {
    _authEntity = await SkyAuthSharedPrefEntity.example.getFromSharedPref() as SkyAuthSharedPrefEntity;
    _userEntity = await SkyUserSharedPrefEntity.example.getFromSharedPref() as SkyUserSharedPrefEntity;

  }

  bool get isLoggedIn => _authEntity != null && !_authEntity!.isTokenExpired();

  bool get needLogin =>  !_authEntity!.isValid();

  bool get validUser => _userEntity != null && _userEntity!.isValid();

  SkyUser? get getUser => _userEntity?.toSkyUser();




  Future<void> saveTokens({required SkyAuthSharedPrefEntity authEntity}) async {
    await authEntity.saveToSharedPref();
    _authEntity = authEntity;  // Update local reference
  }

  Future<void> saveUser({required SkyUserSharedPrefEntity userEntity}) async {
    await userEntity.saveToSharedPref();
    _userEntity = userEntity;  // Update local reference
  }

  Future<String> getToken() async {

     if (_authEntity != null ) {
      return _authEntity!.accessToken;
    }
    else
    {
      return '';
     }
  }

  Future<String> getRefreshToken() async {

    if (_authEntity != null ) {
      return _authEntity!.refreshToken;
    }
    else
    {
      return '';
    }
  }

  Future<void> logout() async {
    await SkyUserSharedPrefEntity.example.deleteFromSharedPref();
    await SkyAuthSharedPrefEntity.example.deleteFromSharedPref();
    _authEntity = null;
    _userEntity = null;
  }

  Future<SkyUser?> getCurrentUser() async {

    _userEntity = await SkyUserSharedPrefEntity.example.getFromSharedPref() as SkyUserSharedPrefEntity;

    if (_userEntity != null) {
      return _userEntity!.toSkyUser();
    }
    else
    {
      return null;
    }

  }



  Future<void> refreshCurrentUser() async {
    if (_userEntity == null) return; // No user to refresh

    final UserResponse userResponse = await apiService.getCurrentUser();
    final SkyUserSharedPrefEntity userEntity = userResponse.toSkyUserSharedPrefEntity();
    await userEntity.saveToSharedPref();
    _userEntity = userEntity;
  }

  Future<bool> refreshTokenIfExpired() async {
    if (_authEntity == null) return false; // No token to refresh

    if (_authEntity!.isTokenExpired()) {
      try {
        final String refreshToken = await getRefreshToken();
        final String accessToken = await getToken();

        // Call the API to refresh the token
        final TokenResponse newToken = await apiService.refreshToken(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        // Save the new tokens
        final SkyAuthSharedPrefEntity newAuthEntity = SkyAuthSharedPrefEntity(
          accessToken: newToken.accessToken,
          refreshToken: newToken.refreshToken,
          expiresIn: DateTime.now().millisecondsSinceEpoch ~/ 1000 + newToken.expiresIn,
        );

        await saveTokens(authEntity: newAuthEntity);
        return true; // Token refreshed successfully
      } catch (e) {
        // Token refresh failed (e.g., refresh token expired)
        await logout(); // Clear session and force login
        return false;
      }
    }
    return true; // Token is still valid
  }

}