import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_movie_db/app/screens/home/home_controller.dart';
import 'package:get/get.dart';

class SlideShow extends StatelessWidget {
  final SlideShowController _slideShowController =
      Get.put(SlideShowController());

  SlideShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_slideShowController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return CarouselSlider(
        options: CarouselOptions(
          height: 200,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        items: _slideShowController.imageModels.map((imageModel) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w200${imageModel.image}'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${imageModel.title}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      );
    });
  }
}
