import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/product/product_bloc.dart';
import 'package:flutter_ecommerce_app/extension/extension.dart';
import 'package:flutter_ecommerce_app/models/model.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
      builder: (_) => CatalogScreen(category: category),
      settings: const RouteSettings(name: routeName),
    );
  }

  final Category category;

  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name.toString().toCapitalized(),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        if (state is ProductLoaded) {
          final List<Product> categoryProducts = state.products
              .where((element) => element.category == category.name)
              .toList();
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.15,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            itemCount: categoryProducts.length,
            itemBuilder: (context, index) {
              return Center(
                child: ProductCard(
                  product: categoryProducts[index],
                  widthFactor: 2.2,
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('Something went wrong...'),
          );
        }
      }),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
