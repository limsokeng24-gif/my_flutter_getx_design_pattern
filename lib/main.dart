import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/splash/splash_binding.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx Design Pattern',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      // Generate Route
      getPages: [
        GetPage(name: "/", page: ()=> SplashView(), binding: SplashBinding(), transition: Transition.leftToRight),
        GetPage(name: "/home", page: ()=> SplashView(), binding: SplashBinding(), transition: Transition.leftToRight),
        GetPage(name: "/login", page: ()=> SplashView(), binding: SplashBinding(), transition: Transition.leftToRight),

      ],

    );
  }
}

