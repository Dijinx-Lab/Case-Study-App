import 'package:case_study_app/constants/route_keys.dart';
import 'package:case_study_app/views/splash/splash_screen.dart';
import 'package:case_study_app/views/team/team_code_screen.dart';
import 'package:flutter/material.dart';

class NavigatorRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static List<String> upTransitionRoutes = [];
  static List<String> fadeTransitionRoutes = [];

  static Route<dynamic> allRoutes(RouteSettings settings) {
    Widget page = _getPageForRoute(settings.name, settings.arguments);

    if (upTransitionRoutes.contains(settings.name)) {
      return upTransition(page, settings);
    } else if (fadeTransitionRoutes.contains(settings.name)) {
      return fadeTransition(page, settings);
    } else {
      return MaterialPageRoute<dynamic>(
          settings: settings, builder: (_) => page);
    }
  }

  static Widget _getPageForRoute(String? routeName, Object? arguments) {
    switch (routeName) {
      case initialRouteWithNoArgs:
        return const SplashScreen();
      case teamCodeRoute:
        return const TeamCodeScreen();
      default:
        return const SplashScreen();
    }
  }

  static upTransition(Widget page, RouteSettings routeSettings) {
    return PageRouteBuilder(
      settings: routeSettings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var slideTween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var fadeTween =
            Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(slideTween),
          child: FadeTransition(
            opacity: animation.drive(fadeTween),
            child: child,
          ),
        );
      },
    );
  }

  static fadeTransition(Widget page, RouteSettings routeSettings) {
    return PageRouteBuilder(
      settings: routeSettings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var opacityAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: opacityAnimation,
          child: child,
        );
      },
    );
  }
}
