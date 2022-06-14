import 'package:flutter/material.dart';
import '../models/model.dart';
import 'widgets.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({Key? key,required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
        itemBuilder: (context, index) {

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ProductCard(product: products[index]),
          );
        },
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );
  }
}
