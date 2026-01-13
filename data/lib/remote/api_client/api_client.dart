import 'dart:convert';

import 'package:domain/enum/subscription_level.dart';
import 'package:domain/exceptions/session_exception.dart';
import 'package:domain/exceptions/network_exceptions.dart';
import 'package:domain/util/logger.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';



abstract class ApiClient {
  String get baseUrl;

  Future<Map<String, String>> getCustomHeader();


  Future<Map<String, dynamic>> uploadMedia(
      String endpoint,
      File file, {
        String fileFieldName = 'file',
        Map<String, String>? additionalFields,
        Map<String, String>? headers,
      }) async {
    // Create the multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/$endpoint'),
    );

    // Add headers
    request.headers.addAll(await _buildHeaders(headers));

    // Add the file to the request
    final mimeType = lookupMimeType(file.path); // Determine MIME type
    request.files.add(
      await http.MultipartFile.fromPath(
        fileFieldName,
        file.path,
        contentType: mimeType != null ? MediaType.parse(mimeType) : null,
      ),
    );

    // Add additional form fields if provided
    if (additionalFields != null) {
      request.fields.addAll(additionalFields);
    }

    // Log the request
    _logRequest(
      'POST',
      Uri.parse('$baseUrl/$endpoint'),
      headers: request.headers,
      data: additionalFields,
    );

    // Send the request
    final streamedResponse = await request.send();

    // Convert the streamed response to a regular response
    final response = await http.Response.fromStream(streamedResponse);

    // Log the response
    _logResponse(response);

    // Process the response
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> uploadCancellationRequest(
      String endpoint,
      String confirmationId,
      String reason,
      String description,
      List<File> files,
      {Map<String, String>? headers}) async {

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/$endpoint'),
    );

    // Add headers
    request.headers.addAll(await _buildHeaders(headers));

    // Add text fields
    request.fields['ConfirmationId'] = confirmationId;
    request.fields['Reason'] = reason;
    request.fields['Description'] = description;

    // Add multiple files
    for (var file in files) {
      final mimeType = lookupMimeType(file.path); // Determine MIME type
      request.files.add(
        await http.MultipartFile.fromPath(
          'Files',  // Adjust field name as per your API
          file.path,
          contentType: mimeType != null ? MediaType.parse(mimeType) : null,
        ),
      );
    }

    // Log request
    _logRequest('POST', Uri.parse('$baseUrl/$endpoint'),
        data: request.fields, headers: request.headers);

    // Send the request
    final streamedResponse = await request.send();

    // Convert to response
    final response = await http.Response.fromStream(streamedResponse);

    // Log response
    _logResponse(response);

    // Process response
    return _processResponse(response);
  }


  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    final url = Uri.parse('$baseUrl/$endpoint').replace(
      queryParameters: queryParameters?.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    _logRequest('GET', url, headers: await getCustomHeader());

    final response = await http.get(url, headers: await getCustomHeader());

    Logger.debug(response.toString());

    _logResponse(response);

    return _processResponse(response);
  }

  Future<Map<String, dynamic>> post(String endpoint,
      {Map<String, dynamic>? data, Map<String, String>? headers}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: await _buildHeaders(headers),
    );

    _logRequest('POST', Uri.parse('$baseUrl/$endpoint'),
        data: data, headers: headers);
    _logResponse(response);

    return _processResponse(response);
  }

  Future<Map<String, dynamic>> put(String endpoint,
      {Map<String, dynamic>? data, Map<String, String>? headers}) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: await _buildHeaders(headers),
    );

    _logRequest('PUT', Uri.parse('$baseUrl/$endpoint'),
        data: data, headers: headers);
    _logResponse(response);

    return _processResponse(response);
  }

  Future<Map<String, dynamic>> delete(String endpoint,
      {Map<String, String>? headers}) async {
    _logRequest('DELETE', Uri.parse('$baseUrl/$endpoint'), headers: headers);

    final response = await http.delete(
      Uri.parse('$baseUrl/$endpoint'),
      headers: await _buildHeaders(headers),
    );

    _logResponse(response);

    return _processResponse(response);
  }

  Future<Map<String, String>> _buildHeaders(
      Map<String, String>? headers) async {
    return {...await getCustomHeader(), ...?headers};
  }

  void _logRequest(String method, Uri url,
      {Map<String, dynamic>? data, Map<String, String>? headers}) {
    Logger.info('Sending $method request to $url', prettyPrint: true);
    if (headers != null && headers.isNotEmpty) {
      var formattedHeaders = const JsonEncoder.withIndent(' ').convert(headers);
      Logger.info('Request Headers: $formattedHeaders');
    }
    if (data != null && data.isNotEmpty) {
      Logger.info('Request Data: $data');
    }
  }

  void _logResponse(http.Response response) {
    if (response.statusCode == 401){
      return;
    }
    if (response.body.isEmpty) {
      return;
    }
    var jsonObj = jsonDecode(response.body);
    // The response could be minified, so we need to re-encode it to get a formatted JSON string
    var formattedJsonStr = const JsonEncoder.withIndent('  ').convert(jsonObj);
    Logger.info(
      'Received response - Status code: ${response.statusCode}, Body: $formattedJsonStr',
      prettyPrint: true,
    );
    if (response.headers.isNotEmpty) {
      var formattedHeaders =
          const JsonEncoder.withIndent(' ').convert(response.headers);
      Logger.info('Response Headers: $formattedHeaders');
    }
  }

  // Map<String, dynamic> _processResponse(http.Response response) {
  //   final Map<String, dynamic> data = jsonDecode(response.body);
  //
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     return data;
  //   } else {
  //     throw NetworkException(
  //       data['error'] ?? data['message'] ?? 'Unknown error',
  //       code: response.statusCode,
  //     );
  //   }
  // }

  // Map<String, dynamic> _processResponse(http.Response response) {
  //   // Decode JSON, handle potential list response
  //   final dynamic decodedData = jsonDecode(response.body);
  //
  //   // Check if decoded data is a list
  //   final Map<String, dynamic> data;
  //   if (decodedData is List) {
  //     data = {'items': decodedData}; // Wrap list in a map with a key
  //   } else if (decodedData is Map<String, dynamic>) {
  //     data = decodedData;
  //   } else {
  //     throw const FormatException("Unexpected response format");
  //   }
  //
  //   // Handle status code
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     return data;
  //   } else {
  //     throw NetworkException(
  //       data['detail'] ?? data['title'] ?? data['error'] ?? data['message'] ?? 'Unknown error',
  //       code: response.statusCode,
  //     );
  //   }
  // }

  // Map<String, dynamic> _processResponse(http.Response response) {
  //   try {
  //     final String body = response.body.trim(); // Trim to remove unnecessary spaces
  //
  //     if (body.isEmpty) {
  //       return {'message': 'No content', 'success': response.statusCode >= 200 && response.statusCode < 300};
  //     }
  //
  //     // Try parsing as JSON
  //     final dynamic decodedData = jsonDecode(body);
  //
  //     // Convert JSON list to a Map
  //     final Map<String, dynamic> data;
  //     if (decodedData is List) {
  //       data = {'items': decodedData};
  //     } else if (decodedData is Map<String, dynamic>) {
  //       data = decodedData;
  //     } else {
  //       throw const FormatException("Unexpected response format");
  //     }
  //
  //     if (response.statusCode >= 200 && response.statusCode < 300) {
  //       return data;
  //     } else {
  //       throw NetworkException(
  //         data['detail'] ?? data['title'] ?? data['error'] ?? data['message'] ?? 'Unknown error',
  //         code: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     // If JSON decoding fails, return raw text or boolean as a response
  //     final String body = response.body.trim();
  //
  //     if (body.toLowerCase() == 'true' || body.toLowerCase() == 'false') {
  //       return {'success': body.toLowerCase() == 'true'};
  //     } else if (RegExp(r'^-?\d+(\.\d+)?$').hasMatch(body)) {
  //       return {'value': num.tryParse(body)};
  //     } else {
  //       return {'message': body, 'status': response.statusCode};
  //     }
  //   }
  // }

  Map<String, dynamic> _processResponse(http.Response response) {

    debugPrint(response.statusCode.toString());

    if(response.statusCode == 401){
      throw SessionException('Unauthorized');
    }

      final String body = response.body.trim(); // Trim to remove unnecessary spaces



      if (body.isEmpty) {
        return {'message': 'No content', 'success': response.statusCode >= 200 && response.statusCode < 300};
      }

      // Try parsing as JSON

      dynamic decodedData = jsonDecode(body);


      // Convert JSON list to a Map
      final Map<String, dynamic> data;
      if (decodedData is List) {
        data = {'items': decodedData};
      } else if (decodedData is Map<String, dynamic>) {
        data = decodedData;
      }
      else if (decodedData is String) {
        data = {'message': decodedData};
      }
      else if (decodedData is bool) {
        data = {'success': decodedData};
      }
      else {
        throw const FormatException("Unexpected response format");
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return data;
      } else {
        throw NetworkException(
          data['detail'] ?? data['title'] ?? data['error'] ?? data['message'] ?? 'Unknown error',
          code: response.statusCode,
        );
      }

  }








}
