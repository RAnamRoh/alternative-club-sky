

import 'package:data/remote/api_client/api_client.dart';
import 'package:data/sessionManager/user_session_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ClubAltApiClient extends ApiClient {
  @override
  
  String get baseUrl => dotenv.env['API_BASE_URL']!;



  @override
  Future<Map<String, String>> getCustomHeader() async {
    // final accessToken = (await UserSessionSharedPrefEntity.example
    //     .getFromSharedPref() as UserSessionSharedPrefEntity)
    //     .accessToken;

   // final String accessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjdhODcwMDQ3LWI4YzQtNGU0Yy04ZDc3LTc3YjIwZWQzMTE0NiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJSYWtpYnVsICBBbmFtIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiYnJhaW5zdGF0aW9ucm9oQGdtYWlsLmNvbSIsImV4dGVybmFsX3N1YiI6IjdhODcwMDQ3LWI4YzQtNGU0Yy04ZDc3LTc3YjIwZWQzMTE0NiIsIm5iZiI6MTczODc0NDk0NiwiZXhwIjoxNzM4NzU1NzQ2LCJpc3MiOiJodHRwczovL2FwaS5kZXYuc2t5Y2x1YjM2NS5jb20vYXBpLyIsImF1ZCI6Imh0dHBzOi8vZGV2LnNreWNsdWIzNjUuY29tLyJ9.yRy6SCVAp4WzU4p5tJ0hZE5FnYSx9z8xJRtRDZ6oU9U';

  final accessToken = await UserSessionManager().getToken();

    //final accessToken = dumy;

   // final accessToken = '';


    return {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
    };
  }

}