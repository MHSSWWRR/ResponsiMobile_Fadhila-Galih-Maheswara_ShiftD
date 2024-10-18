import 'dart:convert';
import 'package:http/http.dart' as http;
import 'app_exception.dart';
import 'api_url.dart';

class Api {
  // POST Request
  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.baseUrl + url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      responseJson = _response(response);
    } catch (e) {
      throw FetchDataException('Error while sending POST request');
    }
    return responseJson;
  }

  // GET Request
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(ApiUrl.baseUrl + url));
      responseJson = _response(response);
    } catch (e) {
      throw FetchDataException('Error while fetching data');
    }
    return responseJson;
  }

  // PUT Request
  Future<dynamic> put(String url, Map<String, dynamic> body) async {
    var responseJson;
    try {
      final response = await http.put(
        Uri.parse(ApiUrl.baseUrl + url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      responseJson = _response(response);
    } catch (e) {
      throw FetchDataException('Error while sending PUT request');
    }
    return responseJson;
  }

  // DELETE Request
  Future<dynamic> delete(String url) async {
    var responseJson;
    try {
      final response = await http.delete(Uri.parse(ApiUrl.baseUrl + url));
      responseJson = _response(response);
    } catch (e) {
      throw FetchDataException('Error while sending DELETE request');
    }
    return responseJson;
  }

  // Handling response
  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}
