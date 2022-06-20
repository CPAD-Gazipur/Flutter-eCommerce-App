import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/wishlist/wishlist_bloc.dart';
import '../../widgets/widgets.dart';

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
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'WishList',
        isWishList: true,
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is WishlistLoaded) {
            if (state.wishList.products.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.hourglass_empty,
                      size: 40,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'No Item in you Wishlist',
                      style: Theme.of(context).textTheme.bodyText1!,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('Go For Shopping'),
                    ),
                  ],
                ),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.4,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0,
                ),
                itemCount: state.wishList.products.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: ProductCard(
                      product: state.wishList.products[index],
                      widthFactor: 1.1,
                      leftPosition: 100,
                      isWishList: true,
                    ),
                  );
                },
              );
            }
          } else {
            return const Center(child: Text('Something went wrong...'));
          }
        },
      ),
    );
  }
}
