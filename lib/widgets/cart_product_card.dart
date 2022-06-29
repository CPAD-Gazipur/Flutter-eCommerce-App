import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blocs.dart';
import '../models/model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.03),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: Image.network(
                product.imageUrl,
                height: 80,
                width: 100,
                fit: BoxFit.cover,
              ),
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
                BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(RemoveProductFromCart(product));
                    },
                    icon: const Icon(Icons.remove_circle),
                  );
                }),
                Text(
                  '$quantity',
                  style: Theme.of(context).textTheme.headline6,
                ),
                BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddProductToCart(product));
                    },
                    icon: const Icon(Icons.add_circle),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
