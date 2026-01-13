
import 'package:data/remote/api_client/api_client.dart';

class SearchTicketApiClient extends ApiClient {
  @override
  // TODO: implement baseUrl
  String get baseUrl => throw UnimplementedError();

  @override
  Future<Map<String, String>> getCustomHeader()  async {
    return {
      'Content-Type': 'application/json',
    };

  }

}