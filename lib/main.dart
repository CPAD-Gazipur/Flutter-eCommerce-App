import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/wishlist/wishlist_bloc.dart';
import 'config/config.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()..add(StartWishList()),
        ),
      ],
      child: MaterialApp(
        title: 'eEcommerce App',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoute.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
