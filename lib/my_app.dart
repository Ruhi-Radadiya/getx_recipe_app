import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app_getx/view/screens/cart_page.dart';
import 'package:recipe_app_getx/view/screens/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/cart',
          page: () => const CartPage(),
        ),
      ],
    );
  }
}
