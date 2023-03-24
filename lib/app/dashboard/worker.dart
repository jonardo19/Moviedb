import 'dart:convert';

import 'package:flutter_movie_db/app/models/discover_models.dart';
import 'package:get/get.dart';
import 'dart:developer';
import '../services/api_service.dart';

class AppWorker {
  final ApiService apiService = Get.find();

  getDiscover(page) async {
    return await apiService.fetchDataDiscover(page).then(
      (value) {
        if (value.statusCode == 200 || value.statusCode == 201) {
          return value.body;
        } else {
          log("${value.statusCode}");
        }
      },
    );
  }

  getDiscoverPagination(int page) async {
    final response = await apiService.fetchDataDiscoverPagination(page);
    if (response.statusCode == 200) {
      return MovieResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }

  getTopRated(page) async {
    return await apiService.fetchDataTopRated(page).then(
      (value) {
        if (value.statusCode == 200 || value.statusCode == 201) {
          return value.body;
        } else {
          log("${value.statusCode}");
        }
      },
    );
  }

  getDetail(id) async => await apiService.fetchDataDetail(id).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
}
