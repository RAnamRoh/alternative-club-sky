import 'dart:io';

import 'package:data/remote/request/sign_up_request.dart';
import 'package:data/remote/response/auth/login_response.dart';
import 'package:data/remote/response/auth/media_upload_response.dart';
import 'package:data/remote/response/auth/sign_up_response.dart';
import 'package:data/remote/response/auth/user_response.dart';

abstract class AuthApiService {



  Future<TokenResponse> login(String email, String password) ;
  Future<SignUpResponse> signUp(SignUpRequest request) ;
  Future<UserResponse> getCurrentUser();
  Future<TokenResponse> refreshToken({required String accessToken, required String refreshToken});
  Future<UserResponse> updateUser({required UserResponse userResponse}) ;
  Future<MediaUploadResponse> uploadMedia(File imageFile) ;
  Future<void> forgotPassword({required String email}) ;
  Future<void> changePassword({required String oldPassword, required String newPassword}) ;


}