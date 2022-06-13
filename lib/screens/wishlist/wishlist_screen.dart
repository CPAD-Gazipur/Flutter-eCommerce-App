import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';


class WishListScreen extends StatelessWidget {

  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const WishListScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'WishList',),
    );
  }
}
