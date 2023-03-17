import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/screens/home/home_screen.dart';
import 'app/screens/list/list_screen.dart';
import 'app/screens/search/search_screen.dart';
import 'app/screens/user/user_screen.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  // final HomeViewModel homeViewModel = HomeViewModel();
  int selectedIndex = 0;

  //MARK: List Items Bottom Bar
  final List<Widget> children = [
    const HomeScreen(),
    const SearchScreen(),
    const ListScreen(),
    const UserScreen(),
  ];

  //MARK: Action Tap Index Bottom Nav bar
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: Body
      body: children[selectedIndex],

      //MARK: Tabbar Navigation
      bottomNavigationBar: CupertinoTabBar(
        height: 60,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: selectedIndex == 0
                ? Image.asset(
                    'assets/icons/home.png',
                    height: 25,
                    width: 25,
                    color: Colors.blue,
                  )
                : Image.asset(
                    'assets/icons/home.png',
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? Image.asset(
                    'assets/icons/search.png',
                    height: 25,
                    width: 25,
                    color: Colors.blue,
                  )
                : Image.asset(
                    'assets/icons/search.png',
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? Image.asset(
                    'assets/icons/list.png',
                    height: 25,
                    width: 25,
                    color: Colors.blue,
                  )
                : Image.asset(
                    'assets/icons/list.png',
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? Image.asset(
                    'assets/icons/user.png',
                    height: 25,
                    width: 25,
                    color: Colors.blue,
                  )
                : Image.asset(
                    'assets/icons/user.png',
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
