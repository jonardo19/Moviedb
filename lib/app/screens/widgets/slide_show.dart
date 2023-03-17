import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_movie_db/app/models/discover_models.dart';

import 'package:flutter_movie_db/app/screens/home/home_controller.dart';
import 'package:get/get.dart';

class SlideShow extends StatefulWidget {
  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  final SlideShowController _slideShowController =
      Get.put(SlideShowController());

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Obx(
        () {
          if (_slideShowController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return PageView.builder(
              itemCount: _slideShowController.results.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    height: 100,
                    width: 400,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w200${_slideShowController.results[index].backdropPath}')),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Text(_slideShowController
                                  .results[index].originalTitle ??
                              ''),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}







// class SlideShow extends GetView<SlideShowController> {
//   const SlideShow({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // return CarouselSlider(
//     //     options: CarouselOptions(
//     //       height: 200,
//     //       enlargeCenterPage: true,
//     //       autoPlay: true,
//     //       aspectRatio: 16 / 9,
//     //       autoPlayCurve: Curves.fastOutSlowIn,
//     //       enableInfiniteScroll: true,
//     //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
//     //       viewportFraction: 0.8,
//     //     ),
//     //     items:
//     return Scaffold(
//       body: Obx(
//         () => PageView.builder(
//           // controller: _controller,
//           physics: const BouncingScrollPhysics(),
//           itemCount: controller.listData.length,
//           itemBuilder: (context, index) {
//             DiscoverModels list = controller.listData[index];
//             return Container(
//               child: Text(list.results.toString()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
