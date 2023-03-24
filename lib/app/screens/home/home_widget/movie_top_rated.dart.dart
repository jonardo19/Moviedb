import 'package:flutter/material.dart';
import 'package:flutter_movie_db/app/dashboard/controller.dart';
import 'package:flutter_movie_db/app/utils/constans.dart';
import 'package:get/get.dart';

class TopRated extends GetView<AppController> {
  const TopRated({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      controller.getTopRated(2);
    });
    var width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Obx(
        () => controller.isLoading.value
            ? const Visibility(
                visible: false, child: CircularProgressIndicator())
            : SizedBox(
                height: width / 1.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 10.0,
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 10,
                              right: 10,
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Image.network(
                              controller.topRated == null
                                  ? "https://mardizu.co.id/assets/images/client/default.png"
                                  : '${AppConstans.imageUrlOriginal}/${controller.topRated!.results![index].posterPath}',
                              fit: BoxFit.cover,
                              width: width * 4 / 3 / 4,
                              height: width / 2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 150,
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 10,
                              right: 10,
                            ),
                            child: Text(
                              controller.topRated == null
                                  ? ""
                                  : controller
                                      .topRated!.results![index].originalTitle!,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
