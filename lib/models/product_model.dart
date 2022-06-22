import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final num price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  static Product fromSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
      name: snapshot['name'],
      category: snapshot['category'],
      imageUrl: snapshot['imageUrl'],
      price: snapshot['price'],
      isRecommended: snapshot['isRecommended'],
      isPopular: snapshot['isPopular'],
    );

    return product;
  }

  /*static List<Product> products = [
    const Product(
      name: 'iPhone 9',
      category: 'smartphones',
      imageUrl: 'https://dummyjson.com/image/i/products/1/thumbnail.jpg',
      price: 549,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Samsung Universe 9',
      category: 'smartphones',
      imageUrl: 'https://dummyjson.com/image/i/products/3/thumbnail.jpg',
      price: 1249,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'OPPOF19',
      category: 'smartphones',
      imageUrl: 'https://dummyjson.com/image/i/products/4/thumbnail.jpg',
      price: 280,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Huawei P30',
      category: 'smartphones',
      imageUrl: 'https://dummyjson.com/image/i/products/5/thumbnail.jpg',
      price: 499,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'MacBook Pro',
      category: 'laptops',
      imageUrl: 'https://dummyjson.com/image/i/products/6/thumbnail.png',
      price: 1749,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Samsung Galaxy Book',
      category: 'laptops',
      imageUrl: 'https://dummyjson.com/image/i/products/7/thumbnail.jpg',
      price: 1499,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Microsoft Surface Laptop 4',
      category: 'laptops',
      imageUrl: 'https://dummyjson.com/image/i/products/8/thumbnail.jpg',
      price: 1499,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'HP Pavilion 15-DK1056WM',
      category: 'laptops',
      imageUrl: 'https://dummyjson.com/image/i/products/10/thumbnail.jpeg',
      price: 1099,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Perfume Oil',
      category: 'fragrances',
      imageUrl: 'https://dummyjson.com/image/i/products/11/thumbnail.jpg',
      price: 13,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Brown Perfume',
      category: 'fragrances',
      imageUrl: 'https://dummyjson.com/image/i/products/12/thumbnail.jpg',
      price: 40,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Fog Scent Xpressio Perfume',
      category: 'fragrances',
      imageUrl: 'https://dummyjson.com/image/i/products/13/thumbnail.webp',
      price: 13,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Non-Alcoholic Concentrated Perfume Oil',
      category: 'fragrances',
      imageUrl: 'https://dummyjson.com/image/i/products/14/thumbnail.jpg',
      price: 120,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Hyaluronic Acid Serum',
      category: 'skincare',
      imageUrl: 'https://dummyjson.com/image/i/products/16/thumbnail.jpg',
      price: 19,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Tree Oil 30ml',
      category: 'skincare',
      imageUrl: 'https://dummyjson.com/image/i/products/17/thumbnail.jpg',
      price: 12,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Oil Free Moisturizer 100ml',
      category: 'skincare',
      imageUrl: 'https://dummyjson.com/image/i/products/18/thumbnail.jpg',
      price: 40,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Skin Beauty Serum.',
      category: 'skincare',
      imageUrl: 'https://dummyjson.com/image/i/products/19/thumbnail.jpg',
      price: 46,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Daal Masoor 500 grams',
      category: 'groceries',
      imageUrl: 'https://dummyjson.com/image/i/products/21/thumbnail.png',
      price: 20,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Elbow Macaroni - 400 gm',
      category: 'groceries',
      imageUrl: 'https://dummyjson.com/image/i/products/22/thumbnail.jpg',
      price: 14,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Orange Essence Food Flavou',
      category: 'groceries',
      imageUrl: 'https://dummyjson.com/image/i/products/23/thumbnail.jpg',
      price: 14,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Gulab Powder 50 Gram',
      category: 'groceries',
      imageUrl: 'https://dummyjson.com/image/i/products/25/thumbnail.jpg',
      price: 70,
      isRecommended: true,
      isPopular: false,
    ),
  ];*/

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];
}
