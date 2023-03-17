import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/app/models/discover_models.dart';
import 'package:flutter_movie_db/app/models/home_models/slideshow_models.dart';
import 'package:flutter_movie_db/app/services/api_service.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class SlideShowController extends GetxController {
  var isLoading = true.obs;
  var results = <Results>[].obs;
  List<SlideShowImageModel> imageModels = [];

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      var discoverModel = await ApiService().getDiscoverMovies();
      if (discoverModel != null) {
        discoverModel.results?.forEach((data) {
          imageModels.add(
            SlideShowImageModel(image: data.backdropPath, title: data.title),
          );
        });

        results.assignAll(discoverModel.results!);
      }
    } finally {
      isLoading(false);
    }
  }
}
// class SlideShowController extends GetxController {
//   List listData = List<DiscoverModels>.empty().obs;
//   var isLoding = false.obs;

//   void getFilm() {
//     listData.clear();
//     isLoding.value = true;

//     ApiService().getDiscover().then((Response response) {
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonResponse = response.body;
//         jsonResponse.forEach((key, value) {
//           DiscoverModels discoverModels = DiscoverModels.fromJson(value);
//           discoverModels = value;
//         });
//       } else {
//         Get.snackbar('Error', response.statusText!);
//       }
//       isLoding(false);
//     });
//   }

//   @override
//   void init() {
//     getFilm();

//     super.onInit();
//   }
// }
