import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_movie_db/app/utils/constans.dart';
import '../../dashboard/controller.dart';

class DetailMovie extends GetView<AppController> {
  const DetailMovie({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      controller.getDetail(Get.parameters["id"]);
    });

    return Obx(() => controller.isLoading.value
        ? const Visibility(visible: false, child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.black,
            body: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  expandedHeight: MediaQuery.of(context).size.height / 1.7,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(left: 8),
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black26),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, right: 16),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black26),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                  flexibleSpace: Stack(children: [
                    FlexibleSpaceBar(
                      background: ShaderMask(
                        shaderCallback: (rectangle) {
                          return const LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ).createShader(Rect.fromLTRB(
                              0, 0, rectangle.width, rectangle.height));
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.network(
                          controller.detail == null
                              ? "https://mardizu.co.id/assets/images/client/default.png"
                              : "${AppConstans.imageUrlOriginal}${controller.detail!.posterPath!}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: MediaQuery.of(context).size.height / 13,
                          width: double.infinity,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: double.tryParse('1 + 1'),
                                  width: 300,
                                  child: Text(
                                    controller.detail == null
                                        ? ""
                                        : controller.detail!.title!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ]),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: double.tryParse('1 + 1'),
                        width: double.tryParse('1 + 1'),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          controller.detail == null
                              ? ""
                              : "IMDB ${controller.detail!.voteAverage!.roundToDouble()}"
                                  .toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.timelapse,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                              controller.detail == null
                                  ? ""
                                  : controller.detail!.runtime.toString(),
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            controller.detail == null
                                ? ""
                                : controller.detail!.releaseDate.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
  }
}
