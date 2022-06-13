import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';


class CartScreen extends StatelessWidget {

  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CartScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Cart',),
    );
  }
}
