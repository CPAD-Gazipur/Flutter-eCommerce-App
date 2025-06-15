import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.authUser != current.authUser,
      listener: (context, state) {
        debugPrint('Splash Screen Auth Listener');
      },
      child: Scaffold(
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
                    .displayMedium!
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
