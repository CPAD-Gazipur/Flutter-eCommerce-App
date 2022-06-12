import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/config/app_router.dart';
import 'screens/screens.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter eEcommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoute.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}


