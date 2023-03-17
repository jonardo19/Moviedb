import 'package:flutter/material.dart';
import 'package:flutter_movie_db/app/screens/home/home_screen.dart';
import 'package:flutter_movie_db/app/screens/widgets/slide_show.dart';
import 'package:flutter_movie_db/main_tabbar.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
