import 'dart:convert';

import 'package:data/remote/api_client/api_client.dart';
import 'package:data/remote/api_service/sky_home_api_service.dart';
import 'package:data/remote/request/verify_otp_request.dart';
import 'package:data/remote/response/home/airport_response.dart';
import 'package:data/remote/response/home/current_location_response.dart';
import 'package:domain/enum/subscription_level.dart';

class SkyHomeApiServiceImpl implements SkyHomeApiService {
  final ApiClient apiClient;
  final ApiClient locationApiClient;

  SkyHomeApiServiceImpl(
      {required this.apiClient, required this.locationApiClient});

  @override
  Future<List<AirportResponse>> searchAirport({required String query}) async {
    final response = await apiClient.get('common/airports/$query');

    final items = response['items'] as List<dynamic>;

    final flights = items.map((json) {
      return AirportResponse.fromJson(json);
    }).toList();

    return flights;
  }

  @override
  Future<void> sendVerificationLink() async {
    await apiClient.post('user/requestEmailVerification');
  }

  @override
  Future<CurrentLocationResponse> getCurrentLocation() async {
    final response = await locationApiClient.get('json');

    final location = CurrentLocationResponse.fromJson(response);

    return location;
  }

  @override
  Future<AirportResponse> getAirport({required String query}) async {
    final response = await apiClient.get('common/airports/$query');

    final items = response['items'] as List<dynamic>;

    final flights = items.map((json) {
      return AirportResponse.fromJson(json);
    }).toList();

    final airport = flights[0];

    return airport;
  }

  @override
  Future<void> sendOTP() async {
    await apiClient.post('user/phoneVerification/request');
  }

  @override
  Future<void> verifyOTP({required String otp}) async {
    VerifyOtpRequest request = VerifyOtpRequest(verificationCode: otp);

    Map<String, dynamic> data = request.toJson();

    await apiClient.post('user/phoneVerification/verify', data: data);
  }
}
