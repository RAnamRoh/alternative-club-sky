

import 'package:data/remote/response/home/airport_response.dart';
import 'package:domain/model/skyClubModels/airport.dart';

class AirportMapper {
  /// Maps an [AirportResponse] object to an [Airport] domain model.
  static Airport fromResponse(AirportResponse response) {
    return Airport(
      name: response.vendorName,
      city: response.cityName,
      country: response.countryName,
      code: response.vendorCode,
    );
  }

  /// Maps a list of [AirportResponse] objects to a list of [Airport] domain models.
  static List<Airport> fromResponseList(List<AirportResponse> responseList) {
    return responseList.map((response) => fromResponse(response)).toList();
  }
}