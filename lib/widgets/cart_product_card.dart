import 'package:flutter/material.dart';

import '../models/model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.03),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.network(
              product.imageUrl,
              height: 80,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    '\$${product.price}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_circle),
                ),
                Text(
                  '1',
                  style: Theme.of(context).textTheme.headline6,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
