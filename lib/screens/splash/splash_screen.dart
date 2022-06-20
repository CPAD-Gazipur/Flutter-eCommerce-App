import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              'https://static.vecteezy.com/system/resources/previews/003/092/544/original/e-commerce-logo-with-pointer-and-shopping-bag-free-vector.jpg',
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            child: Text(
              'Flutter e-Commerce',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
