import 'package:get/get.dart';

class ApiService extends GetConnect {
  static const String baseURL = 'https://api.themoviedb.org/3';
  static String apiKey = '0f57fbf8d0e26c00c866487b92ee1efc';

  Future<Response> fetchDataDiscover(page) async =>
      get('$baseURL/discover/movie?api_key=$apiKey&page=$page');

  Future<Response> fetchDataDiscoverPagination(page) async =>
      get('$baseURL/discover/movie?api_key=$apiKey&page=$page');

  Future<Response> fetchDataTopRated(page) async =>
      get("$baseURL/movie/top_rated?api_key=$apiKey&page=$page");

  Future<Response> fetchDataDetail(id) async =>
      get("$baseURL/movie/$id?api_key=$apiKey");
}

class ApiServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
  }
}
