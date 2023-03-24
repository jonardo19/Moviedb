import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/app/dashboard/controller.dart';
import 'package:get/get.dart';

import 'app/screens/home/home_screen.dart';
import 'app/screens/list/list_screen.dart';
import 'app/screens/search/search_screen.dart';
import 'app/screens/user/user_screen.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (controller) {
      return Scaffold(
          body: IndexedStack(
            index: controller.tabBarIndex,
            children: const [
              HomeScreen(),
              SearchScreen(),
              ListScreen(),
              UserScreen()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.tabBarIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: controller.changeTabIndex,
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/home.png',
                  color: Colors.grey,
                  height: 25,
                  width: 25,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/search.png',
                  color: Colors.grey,
                  height: 25,
                  width: 25,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/list.png',
                  color: Colors.grey,
                  height: 25,
                  width: 25,
                ),
                label: 'List',
              ),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/user.png',
                    color: Colors.grey,
                    height: 25,
                    width: 25,
                  ),
                  label: 'User'),
            ],
          ));
    });
  }
}
