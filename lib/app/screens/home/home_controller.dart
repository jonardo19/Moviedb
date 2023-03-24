// import 'package:flutter_movie_db/app/models/discover_models.dart';
// import 'package:flutter_movie_db/app/services/api_service.dart';
// import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;

// class HomeController extends GetxController {
//   final ApiService homeController = Get.put(ApiService());

//   var isLoading = false.obs;

//   List<Results> movies = <Results>[].obs;
//   int page = 1;

//   @override
//   void onInit() {
//     getDiscMovies();
//     super.onInit();
//   }

//   Future<void> getDiscMovies() async {
//     isLoading(true);
//     try {
//       final results = await homeController.getDiscoverMovies(page);
//       movies.addAll(results);
//     } catch (e) {
//       print(e);
//     }
//     isLoading(false);
//   }
// }
