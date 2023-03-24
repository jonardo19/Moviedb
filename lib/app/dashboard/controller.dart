import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/app/dashboard/interaktor.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/discover_models.dart';
import '../models/movie_detail_model.dart';

class AppController extends GetxController {
  final AppInteractor appInteractor = Get.find();

  var tabBarIndex = 0;

  void changeTabIndex(index) {
    tabBarIndex = index;
    update();
  }

  var isLoading = false.obs;

  // var discoverNu = MovieResponseModel.obs;
  List<Results> discover = <Results>[].obs;

  getDiscover(page) async {
    isLoading(true);
    try {
      discover = (await appInteractor.handleDiscover(page: page))!;
      // Print
      if (kDebugMode) {
        print(discover);
      }
    } catch (e) {
      // Print
      if (kDebugMode) {
        print('Erorr getDiscover :  ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  /// Discover Pagingation
  // MovieResponseModel?discoverPagin;
  // void getDiscoverPagination(
  //   BuildContext context, {
  //   required PagingController pagingController,
  //   required int page,
  // }) async {
  //   isLoading(true);
  //   try {
  //     discoverPagin = await appInteractor.handleDiscover(page: page);
  //     if (discoverPagin!.results!.length < 20) {
  //       pagingController.appendLastPage(discoverPagin!.results!);
  //     } else {
  //       pagingController.appendPage(discoverPagin!.results!, page + 1);
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Erorr getDiscoverPagination :  ${e.toString()}');
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  /// Top Rated

  MovieResponseModel? topRated;
  getTopRated(page) async {
    isLoading(true);
    try {
      topRated = await appInteractor.handleTopRated(page);
      // Print
      if (kDebugMode) {
        print(topRated);
      }
    } catch (e) {
      // Print
      if (kDebugMode) {
        print('Erorr getTopRated :  ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  DetailMovieModel? detail;
  List<GenresDetail>? genres = [];
  getDetail(id) async {
    isLoading(true);
    try {
      detail = await appInteractor.handleDetail(id);
      genres = detail!.genres;

      // Print
      if (kDebugMode) {
        print("Detail :$detail");
      }
    } catch (e) {
      // Print
      if (kDebugMode) {
        print('Erorr getDetail :  ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }
}
