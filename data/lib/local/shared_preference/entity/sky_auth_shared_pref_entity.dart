
import 'package:data/local/shared_preference/entity/shared_pref_entity.dart';
import 'package:data/model/mappable.dart';

class SkyAuthSharedPrefEntity  extends SharedPrefEntity {

  String accessToken;
  String refreshToken;
  int expiresIn;


  SkyAuthSharedPrefEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  }){
    if (accessToken.isEmpty) throw ArgumentError('accessToken cannot be empty');
    if (refreshToken.isEmpty) {
      throw ArgumentError('refreshToken cannot be empty');
    }
  }

  factory SkyAuthSharedPrefEntity.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('expires_in') ||
        !json.containsKey('access_token') ||
        !json.containsKey('refresh_token')) {
      throw ArgumentError('Missing required keys in JSON');
    }

    return SkyAuthSharedPrefEntity(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      expiresIn: json['expires_in'], // Add expiresIn from JSON
    );
  }

  @override
  String toString() {

    return 'SkyAuthSharedPrefEntity(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn)';
  }

  static SkyAuthSharedPrefEntity example = SkyAuthSharedPrefEntity(
    accessToken: 'example_access_token',
    refreshToken: 'example_refresh_token',
    expiresIn: 3600, // Example expiry time
  );


  @override
  String sharedPrefKey = 'sky_auth';

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    return SkyAuthSharedPrefEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'expires_in': expiresIn, // Include expiresIn in JSON
    };
  }

  bool isValid() {
    return
        accessToken != example.accessToken &&
        refreshToken != example.refreshToken ;

  }


  bool isTokenExpired() {
    // Handle null or invalid expiresIn
    if (expiresIn <= 0) {
      return true; // Treat as expired if expiresIn is invalid
    }

    // Convert expiresIn (in seconds) to a DateTime
    final expiryDateTime = DateTime.fromMillisecondsSinceEpoch(expiresIn * 1000);

    // Add a small buffer (e.g., 5 seconds) to account for latency or clock skew
    final bufferDuration = const Duration(seconds: 5);
    final expiryDateTimeWithBuffer = expiryDateTime.subtract(bufferDuration);

    // Check if the current time is after the expiry time (with buffer)
    return DateTime.now().isAfter(expiryDateTimeWithBuffer);
  }

}