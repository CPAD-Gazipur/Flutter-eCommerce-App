import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/category/category_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/product/product_bloc.dart';
import '../../widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'cCommerce App',
      ),
      bottomNavigationBar: const HomeNavBar(),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }
            if (state is CategoryLoaded) {
              return CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1.7,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: state.categories
                    .map((category) => HeroCarouselCard(
                          category: category,
                        ))
                    .toList(),
              );
            } else {
              return const Center(
                child: Text('Something went wrong..'),
              );
            }
          }),
          const SizedBox(
            height: 5,
          ),
          const SectionTitle(title: 'RECOMMENDED'),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }
            if (state is ProductLoaded) {
              return ProductCarousel(
                products: state.products
                    .where((product) => product.isRecommended)
                    .toList(),
              );
            } else {
              return const Center(
                child: Text('Something went wrong...'),
              );
            }
          }),
          const SectionTitle(title: 'MOST POPULAR'),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductLoading) {
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }
            if (state is ProductLoaded) {
              return ProductCarousel(
                products: state.products
                    .where((product) => product.isPopular)
                    .toList(),
              );
            } else {
              return const Center(
                child: Text('Something went wrong...'),
              );
            }
          }),
        ],
      ),
    );
  }
}
