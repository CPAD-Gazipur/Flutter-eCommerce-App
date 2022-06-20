import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/model.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    debugPrint('This is Route: ${settings.name}');

    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishListScreen.routeName:
        return WishListScreen.route();
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
