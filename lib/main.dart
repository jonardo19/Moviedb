import 'package:flutter/material.dart';
import 'package:flutter_movie_db/app/routes/app_pages.dart';
import 'package:flutter_movie_db/app/services/api_service.dart';
import 'package:flutter_movie_db/main_tabbar.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: ApiServiceBinding(),
    );
  }
}
