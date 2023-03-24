import 'package:get/get.dart';

import '../../main_tabbar.dart';
import '../dashboard/bindings.dart';
import '../screens/home/detail_screen.dart';
import '../screens/home/home_screen.dart';
import 'app_router.dart';

class AppPages {
  static const initial = AppRouters.dashboard;

  static final routes = [
    GetPage(
      name: AppRouters.home,
      page: () => const HomeScreen(),
      binding: AppBinding(),
    ),

    GetPage(
      name: AppRouters.dashboard,
      page: () => MainPage(),
      binding: AppBinding(),
    ),

    GetPage(
      name: '${AppRouters.detailMovie}/:id',
      page: () => const DetailMovie(),
      binding: AppBinding(),
    ),
    // GetPage(
    //   name: AppRouters.register,
    //   page: () => const RegisterScreen(),
    //   binding: RegisterBinding(),
    // ),
  ];
}
