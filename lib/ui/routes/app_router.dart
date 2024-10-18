import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/ui/routes/app_pages.dart';

import '../pages/home/home_binding.dart';

class AppRouter {
  static const initialRoute = "/splash_screen";

  static List<GetPage<dynamic>> routes = [
    GetPage(
        name: '/home_screen',
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        children: [
          GetPage(
              name: '/ejercicios_screen', page: () => const EjerciciosScreen())
        ]),
    GetPage(
      name: '/splash_screen',
      page: () => const SplashScreen(),
    ),
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: ((context) => const HomeScreen()));
  }
}
