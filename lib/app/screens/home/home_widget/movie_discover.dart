import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_movie_db/app/dashboard/controller.dart';
import 'package:get/get.dart';

import '../detail_screen.dart';

class DiscoverMovie extends GetView<AppController> {
  const DiscoverMovie({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      controller.getDiscover(5);
    });
    var width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CarouselSlider.builder(
          options: CarouselOptions(
            height: width / 1.45,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayCurve: Curves.decelerate,
          ),
          itemCount: controller.discover.length,
          itemBuilder: (context, index, realIndex) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => DetailMovie());
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 10.0,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Image.network(
                                'https://image.tmdb.org/t/p/w500${controller.discover[index].backdropPath}',
                                fit: BoxFit.cover,
                                height: constraints.biggest.height,
                                width: constraints.biggest.width,
                              ),
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  width: constraints.biggest.width,
                                  height: constraints.biggest.height,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black87,
                                      ],
                                    ),
                                  )),
                              Positioned(
                                bottom: 14,
                                left: 14,
                                right: 14,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500/${controller.discover[index].posterPath}',
                                        fit: BoxFit.cover,
                                        height: 200,
                                        width: 120,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${controller.discover[index].title}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${controller.discover[index].voteAverage} (${controller.discover[index].voteCount})',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
