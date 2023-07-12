
import 'package:flutter/material.dart';
import 'package:cinemate/models/home_response_model.dart';
import 'package:cinemate/services/client/base_client.dart';

abstract class HomeScreenRepo {
  Future<HomeScreenResponse> getHomeScreenResponse();
}

class HttpHomeScreenResponse implements HomeScreenRepo {
  @override
  Future<HomeScreenResponse> getHomeScreenResponse() async {
    HomeScreenResponse homeScreenResponse;
    final Map<String, dynamic> response = await BaseClient().getHomeFromMovieDB();
    debugPrint(response.toString());
    homeScreenResponse = HomeScreenResponse.fromJson(response);
    return homeScreenResponse;
  }
}
