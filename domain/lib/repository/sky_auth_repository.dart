import 'dart:io';

import 'package:data/remote/request/sign_up_request.dart';
import 'package:domain/model/skyClubModels/sky_user.dart';


abstract class SkyAuthRepository {
  Future<void> login({required String email, required String password});
  Future<void> signUp({required SignUpRequest request});
  Future<bool> logout();
  Future<void> refreshToken({required String accessToken, required String refreshToken});
  Future<void> updateUser({required SkyUser user});
  Future<void> uploadMedia({required File imageFile});
  Future<void> forgotPassword({required String email});
  Future<void> changePassword({required String currentPassword, required String newPassword});
}