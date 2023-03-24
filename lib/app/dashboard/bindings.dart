import 'package:flutter_movie_db/app/dashboard/controller.dart';
import 'package:flutter_movie_db/app/dashboard/interaktor.dart';
import 'package:flutter_movie_db/app/dashboard/worker.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(AppWorker());
    Get.put(AppInteractor());
    Get.put(AppController());
  }
}
