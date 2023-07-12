import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cinemate/helpers/app_exception.dart';
import 'package:cinemate/constants/api/tmdb_api.dart';

class BaseClient {
  final String _baseUrl = TMDbApi.baseUrl;
  final String _apiKey = TMDbApi.apiKey;
  static const timeOutDuration = 20;


  Future<Map<String, dynamic>> getHomeFromMovieDB() async {
    const url = 'https://moviedb.cyclic.app/api/v1/home';
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
        message: 'NO Internet Connection',
        url: url.toString(),
      );
    } on TimeoutException {
      ApiNotRespondingException(
        message: 'API Not responded in $timeOutDuration Seconds',
        url: url.toString(),
      );
    }
    return {};
  }

  Future<Map<String, dynamic>> get(String api) async {
    final url = '$_baseUrl$api&api_key=$_apiKey';
    // print(url);
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
        message: 'NO Internet Connection',
        url: url.toString(),
      );
    } on TimeoutException {
      ApiNotRespondingException(
        message: 'API Not responded in $timeOutDuration Seconds',
        url: url.toString(),
      );
    }
    return {};
  }

  dynamic _processResponse(
    http.Response response,
  ) {
    switch (response.statusCode) {
      case 200:
        final responseJson = utf8.decode(response.bodyBytes);
        return jsonDecode(responseJson);
      case 400:
        throw BadRequestException(
          message: utf8.decode(response.bodyBytes),
          url: response.request?.url.toString(),
        );
      case 401:
      case 403:
        throw UnAuthorizedException(
          message: utf8.decode(response.bodyBytes),
          url: response.request?.url.toString(),
        );
      case 500:
      default:
        throw FetchDataException(
          message: 'Error occurred with this ${response.statusCode}',
          url: response.request?.url.toString(),
        );
    }
  }
}
