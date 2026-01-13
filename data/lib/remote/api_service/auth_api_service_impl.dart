import 'dart:io';
import 'package:data/remote/api_client/api_client.dart';
import 'package:data/remote/api_service/auth_api_service.dart';
import 'package:data/remote/request/sign_up_request.dart';
import 'package:data/remote/request/user_update_request.dart';
import 'package:data/remote/response/auth/login_response.dart';
import 'package:data/remote/response/auth/media_upload_response.dart';
import 'package:data/remote/response/auth/sign_up_response.dart';
import 'package:data/remote/response/auth/user_response.dart';
import 'package:data/sessionManager/user_session_manager.dart';
import 'package:domain/exceptions/authentication_exception.dart';
import 'package:domain/exceptions/basic_exception.dart';
import 'package:domain/exceptions/network_exceptions.dart';
import 'package:domain/exceptions/session_exception.dart';

class AuthApiServiceImpl extends AuthApiService {
  final ApiClient apiClient;

  AuthApiServiceImpl({required this.apiClient});

  @override
  Future<TokenResponse> login(String email, String password) async {


    try {
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };
      final response = await apiClient.post('user/token', data: data);
      return TokenResponse.fromJson(response);
    } on NetworkException catch (e) {
      throw AuthenticationException(e.message);
    }

  }

  @override
  Future<SignUpResponse> signUp(SignUpRequest request) async {
    try {
      final response = await apiClient.post('user', data: request.toJson());

      return SignUpResponse.fromJson(response);
    } on NetworkException catch (e) {
      throw AuthenticationException(e.message);
    }
  }

  @override
  Future<UserResponse> getCurrentUser() async{
    try {
      final response = await apiClient.get('user/me');

      return UserResponse.fromJson(response);
    } on NetworkException catch (e) {
      throw BasicException(e.message);
    }
  }

  @override
  Future<TokenResponse> refreshToken({required String accessToken, required String refreshToken}) async {
    try {
      Map<String, dynamic> data = {
        'access_token': '$accessToken',
        'refresh_token': '$refreshToken',
      };
      final response = await apiClient.post('user/refreshToken', data: data);
      return TokenResponse.fromJson(response);
    }
     on NetworkException catch(e){
       throw BasicException(e.message);
    }
  }

  @override
  Future<UserResponse> updateUser({ required UserResponse userResponse}) async {

    final currentUser = await UserSessionManager().getCurrentUser();

    final email = currentUser?.email ?? userResponse.email;

    try {
      final UserUpdateRequest userUpdateRequest = userResponse.toUserUpdateRequest();
      final request = userUpdateRequest.toJson();
      final response = await apiClient.put('user/me', data: request);
      return UserResponse.fromJson(response);

    }
    on NetworkException catch(e){
      throw BasicException(e.message);
    } on SessionException catch(e){
      rethrow;
    }
  }

  @override
  Future<MediaUploadResponse> uploadMedia(File imageFile) async{
    final currentUser = await UserSessionManager().getCurrentUser();

    final id = currentUser?.sub ?? '';

    try {
      
      final response = await apiClient.uploadMedia('user/$id/media', imageFile);
      return MediaUploadResponse.fromJson(response);

    }
    on NetworkException catch(e){
      throw BasicException(e.message);
    } on SessionException catch(e){
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {

      final Map<String, dynamic> request = {
        'email': email,
        'clientId': '',
      };

      final response = await apiClient.post('user/forgotPassword', data: request);


    } on NetworkException catch (e) {
      throw AuthenticationException(e.message);
    } on BasicException catch (e) {
      throw BasicException(e.message);
    }
  }

  @override
  Future<void> changePassword({required String oldPassword, required String newPassword}) async {
    try {

      final Map<String, dynamic> request = {
        'currentPassword': oldPassword,
        'newPassword': newPassword,
      };

      final response = await apiClient.post('user/password', data: request);


    } on NetworkException catch (e) {
      throw AuthenticationException(e.message);
    }
  }





}
