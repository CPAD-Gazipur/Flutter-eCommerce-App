import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';


class CatalogScreen extends StatelessWidget {

  static const String routeName = '/catalog';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CatalogScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Catalog',),
    );
  }
}
