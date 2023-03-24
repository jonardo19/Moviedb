import 'package:flutter_movie_db/app/dashboard/worker.dart';
import 'package:get/get.dart';
import '../models/discover_models.dart';
import '../models/movie_detail_model.dart';

class AppInteractor {
  final AppWorker appWorker = Get.find();

  Future<List<Results>?> handleDiscover({int page = 1}) async {
    var discover = await appWorker.getDiscover(page);

    var movieResponseModelResult =
        MovieResponseModel.fromJson(discover).results;

    return movieResponseModelResult;
  }

  Future<MovieResponseModel> handleDiscoverPagination({int page = 1}) async {
    var discoverPagingnation = await appWorker.getDiscoverPagination(page);

    var movieResponseModel = MovieResponseModel.fromJson(
        discoverPagingnation as Map<String, dynamic>);

    return movieResponseModel;
  }

  Future<MovieResponseModel?> handleTopRated(page) async {
    var topRated = await appWorker.getTopRated(page);

    var movieResponseModel = MovieResponseModel.fromJson(topRated);

    return movieResponseModel;
  }

  Future<DetailMovieModel?> handleDetail(id) async {
    var detail = await appWorker.getDetail(id);

    var detailMovieModel = DetailMovieModel.fromJson(detail)
      ..genres
      ..productionCountries;

    return detailMovieModel;
  }
}
