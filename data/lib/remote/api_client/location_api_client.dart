import 'package:data/remote/api_client/api_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationApiClient extends ApiClient {
  @override
  // TODO: implement baseUrl
  String get baseUrl => dotenv.env['GET_CURRENT_LOCATION_URL']!;

  @override
  Future<Map<String, String>> getCustomHeader() async {
    return {
      'Content-Type': 'application/json',
    };
  }
}
