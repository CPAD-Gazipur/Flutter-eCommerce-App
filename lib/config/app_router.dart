import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/home/home_screen.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    debugPrint('This is Route: ${settings.name}');

    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error Page'),
        ),
      ),
      settings: const RouteSettings(name: '/errorPage'),
    );
  }
}
