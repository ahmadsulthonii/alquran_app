import 'package:flutter/material.dart';

BuildContext get globalContext {
  return Get.currentContext;
}

class Get {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static get currentContext {
    return navigatorKey.currentState?.context;
  }

  static Future to(Widget page) async {
    return await navigatorKey.currentState!.push(
      // MaterialPageRoute(builder: (currentContext) => page),
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Geser dari kanan
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        // Durasi transisi
        // transitionDuration: Duration(milliseconds: 100),
      ),

      // PageRouteBuilder(
      //   pageBuilder: (context, animation, secondaryAnimation) => page,
      //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //     return FadeTransition(opacity: animation, child: child);
      //   },
      //   transitionDuration: const Duration(milliseconds: 250),
      // ),
    );
  }

  static back() {
    if (Navigator.canPop(globalContext) == false) return;
    Navigator.pop(globalContext);
  }

  static Future offAll(Widget page) async {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 250),
      ),
      (Route<dynamic> route) => false,
    );
  }

  static double get width {
    return MediaQuery.of(currentContext).size.width;
  }

  static double get height {
    return MediaQuery.of(currentContext).size.width;
  }

  static ValueNotifier<ThemeData> mainTheme = ValueNotifier<ThemeData>(
    ThemeData(),
  );
  static changeTheme(ThemeData theme) {
    mainTheme.value = theme;
  }

  static ThemeData get theme {
    return Theme.of(Get.currentContext);
  }

  static Future toReplacement(Widget page) async {
    return await navigatorKey.currentState!.pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}
