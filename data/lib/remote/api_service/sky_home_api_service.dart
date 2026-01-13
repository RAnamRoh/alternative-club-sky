

import 'package:data/remote/response/home/airport_response.dart';
import 'package:data/remote/response/home/current_location_response.dart';

abstract class SkyHomeApiService {

Future<List<AirportResponse>> searchAirport({required String query});

Future<void> sendVerificationLink();

Future<CurrentLocationResponse> getCurrentLocation();

Future<AirportResponse> getAirport({required String query});

Future<void> sendOTP();

Future<void> verifyOTP({required String otp});


}