import 'package:flutter/material.dart';

import '../extension/extension.dart';
import '../models/model.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category? category;
  final Product? product;

  const HeroCarouselCard({
    super.key,
    this.category,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product == null) {
          Navigator.pushNamed(
            context,
            '/catalog',
            arguments: category,
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                    product == null ? category!.imageUrl : product!.imageUrl,
                    fit: BoxFit.cover,
                    width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    child: Text(
                      product == null ? category!.name.toCapitalized() : '',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
