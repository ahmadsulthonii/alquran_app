import 'package:flutter/material.dart';
import 'package:quran_app/presentation/home_page/home_page_view.dart';
import 'package:quran_app/shared/util/theme_controller.dart';
import 'package:quran_app/state_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, _) {
        return MaterialApp(
          navigatorKey: Get.navigatorKey,
          debugShowCheckedModeBanner: false,

          themeMode: ThemeController.instance.themeMode,

          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.green,
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.green,
            scaffoldBackgroundColor: Colors.black,
          ),

          title: "Quran App",
          home: const HomePageView(),
        );
      },
    );
  }
}
