import 'dart:convert';

class AirportResponse {
  final String vendorCode;
  final String vendorName;
  final String poiName;
  final String cityName;
  final String countryCode;
  final String countryName;
  final String latitude;
  final String longitude;

  // Constructor
  AirportResponse({
    required this.vendorCode,
    required this.vendorName,
    required this.poiName,
    required this.cityName,
    required this.countryCode,
    required this.countryName,
    required this.latitude,
    required this.longitude,
  });

  // Factory method to create an Airport object from a JSON map
  factory AirportResponse.fromJson(Map<String, dynamic> json) {
    return AirportResponse(
      vendorCode: json['vendorCode'] ?? '',
      vendorName: json['vendorName'] ?? '',
      poiName: json['poiName'] ?? '',
      cityName: json['cityName'] ?? '',
      countryCode: json['countryCode'] ?? '',
      countryName: json['countryName'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
    );
  }

  // Method to convert an Airport object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'vendorCode': vendorCode,
      'vendorName': vendorName,
      'poiName': poiName,
      'cityName': cityName,
      'countryCode': countryCode,
      'countryName': countryName,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
