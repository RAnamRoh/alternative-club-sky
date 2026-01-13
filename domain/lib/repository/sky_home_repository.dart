
import 'package:domain/model/skyClubModels/airport.dart';

abstract class SkyHomeRepository {
  Future<List<Airport>> getAirports({required String query});
  Future<void> sendVerificationLink();
  Future<String?> getCurrentLocation();
  Future<Airport> getAirport({required String airportCity});
  Future<void> sendOTP();
  Future<void> verifyOTP({required String otp});

}