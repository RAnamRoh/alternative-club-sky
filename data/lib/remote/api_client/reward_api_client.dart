

import 'package:data/remote/api_client/api_client.dart';

class RewardApiClient extends ApiClient{
  @override
  // TODO: implement baseUrl
  String get baseUrl => '';

  @override
  Future<Map<String, String>> getCustomHeader() async {

    return {
      'Content-Type': 'application/json',
    };

  }

}