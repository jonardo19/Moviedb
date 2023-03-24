// import 'package:flutter/material.dart';
// import 'package:flutter_movie_db/app/dashboard/controller.dart';
// import 'package:flutter_movie_db/app/models/discover_models.dart';
// import 'package:get/get.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// import '../../utils/constans.dart';

// class MoviePaginationPage extends StatefulWidget {
//   const MoviePaginationPage({super.key});

//   @override
//   State<MoviePaginationPage> createState() => _MoviePaginationPageState();
// }

// class _MoviePaginationPageState extends State<MoviePaginationPage> {
//   AppController controller = Get.put(AppController());
//   final PagingController<int, Results> pagingController = PagingController(
//     firstPageKey: 1,
//   );

//   @override
//   void initState() {
//     pagingController.addPageRequestListener((pageKey) {
//       Get.find<AppController>().getDiscoverPagination(
//         context,
//         pagingController: pagingController,
//         page: pageKey,
//       );
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pagination'),
//         backgroundColor: Colors.black,
//       ),
//       body: Obx(
//         () => controller.isLoading.value
//             ? const Visibility(
//                 visible: false, child: CircularProgressIndicator())
//             : PagedListView.separated(
//                 pagingController: pagingController,
//                 builderDelegate: PagedChildBuilderDelegate<Results>(
//                   itemBuilder: (context, item, index) => InkWell(
//                       onTap: () {},
//                       child: Stack(
//                         alignment: Alignment.bottomLeft,
//                         children: [
//                           Image.network(
//                             'https://image.tmdb.org/t/p/w500${controller.discoverPagin!.results![index].backdropPath}',
//                             fit: BoxFit.cover,
//                             height: 400,
//                             width: 400,
//                           ),
//                           Container(
//                               alignment: Alignment.bottomLeft,
//                               height: 200,
//                               width: 400,
//                               decoration: const BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.transparent,
//                                     Colors.black87,
//                                   ],
//                                 ),
//                               )),
//                           Positioned(
//                             bottom: 14,
//                             left: 14,
//                             right: 14,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(12),
//                                   child: Image.network(
//                                     controller.discover == null
//                                         ? "https://mardizu.co.id/assets/images/client/default.png"
//                                         : 'https://image.tmdb.org/t/p/w500${controller.discoverPagin!.results![index].posterPath}',
//                                     fit: BoxFit.cover,
//                                     height: 200,
//                                     width: 120,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   '${controller.discoverPagin!.results?[index].title}',
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.star_rounded,
//                                       color: Colors.amber,
//                                       size: 16,
//                                     ),
//                                     const SizedBox(width: 4),
//                                     Text(
//                                       '${controller.discoverPagin!.results?[index].voteAverage} (${controller.discoverPagin!.results?[index].voteCount})',
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//                 separatorBuilder: (context, index) =>
//                     const SizedBox(height: 10)),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     pagingController.dispose();
//     super.dispose();
//   }
// }
