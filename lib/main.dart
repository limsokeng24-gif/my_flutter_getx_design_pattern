import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/auth/login/login_binding.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/auth/login/login_view.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/home/home_binding.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/home/home_view.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/splash/splash_binding.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/splash/splash_view.dart';

void main() async{
  await GetStorage.init();
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
      //Generate Route
      getPages: [
        GetPage(name: "/", page: ()=> SplashView(), binding: SplashBinding(), transition: Transition.leftToRight),
        GetPage(name: "/home", page: ()=> HomeView(), binding: HomeBinding(), transition: Transition.leftToRight),
        GetPage(name: "/login", page: ()=> LoginView(), binding: LoginBinding(), transition: Transition.leftToRight),

      ],

    );
  }
}
