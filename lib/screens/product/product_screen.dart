import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';


class ProductScreen extends StatelessWidget {

  static const String routeName = '/product';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ProductScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Product',),
    );
  }
}
