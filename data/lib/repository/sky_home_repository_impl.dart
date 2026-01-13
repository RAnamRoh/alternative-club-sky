
import 'package:data/mapper/skyClub/airport_mapper.dart';
import 'package:data/remote/api_service/sky_home_api_service.dart';
import 'package:data/remote/response/home/airport_response.dart';
import 'package:data/remote/response/home/current_location_response.dart';
import 'package:domain/model/skyClubModels/airport.dart';
import 'package:domain/repository/sky_home_repository.dart';
import 'package:domain/util/logger.dart';

class SkyHomeRepositoryImpl implements SkyHomeRepository {

  final SkyHomeApiService apiService;

  SkyHomeRepositoryImpl({required this.apiService});

  @override
  Future<List<Airport>> getAirports({required String query}) async {
    List<AirportResponse> airports =  await apiService.searchAirport(query: query);

    final airportList = AirportMapper.fromResponseList(airports);


    // for (var airport in airportList) {
    //   print(airport.city);
    // }

    return airportList;

  }

  @override
  Future<void> sendVerificationLink() async {
    await apiService.sendVerificationLink();
  }

  @override
  Future<String?> getCurrentLocation() async{
    final CurrentLocationResponse response = await apiService.getCurrentLocation();
    return response.city;
  }

  @override
  Future<Airport> getAirport({required String airportCity}) async {
    final AirportResponse response = await apiService.getAirport(query: airportCity);
    return AirportMapper.fromResponse(response);
  }

  @override
  Future<void> sendOTP() async {
    await apiService.sendOTP();
  }

  @override
  Future<void> verifyOTP({required String otp}) async {
    await apiService.verifyOTP(otp: otp);
  }


}