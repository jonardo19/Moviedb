import 'package:flutter/material.dart';
import 'package:flutter_movie_db/app/dashboard/controller.dart';
import 'package:flutter_movie_db/app/screens/home/home_widget/movie_top_rated.dart.dart';
import 'package:flutter_movie_db/app/screens/home/home_widget/movie_discover.dart';
import 'package:flutter_movie_db/app/screens/home/movie_pagination.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<AppController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          /// app bar
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            automaticallyImplyLeading: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello,',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          'Jonardo Putra',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),

          //Discover Movie
          _WidgetTitle(
            title: 'Discover Movies',
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => MoviePaginationPage(),
              //     ));
            },
          ),
          const DiscoverMovie(),

          /// Top Rated Movies
          _WidgetTitle(title: "Top Rated Movies", onTap: () {}),
          const TopRated()
        ],
      ),
    );
  }
}

class _WidgetTitle extends SliverToBoxAdapter {
  final String title;
  final void Function() onTap;

  const _WidgetTitle({required this.title, required this.onTap});

  @override
  Widget get child => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white),
            ),
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: const [
                  Text(
                    'See All',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 24,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
