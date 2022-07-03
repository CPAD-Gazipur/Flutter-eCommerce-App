import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final num price;
  @HiveField(5)
  final bool isRecommended;
  @HiveField(6)
  final bool isPopular;
  @HiveField(7)
  final String? description;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    this.description,
  });

  static Product fromSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
      id: snapshot.id,
      name: snapshot['name'],
      category: snapshot['category'],
      imageUrl: snapshot['imageUrl'],
      price: snapshot['price'],
      isRecommended: snapshot['isRecommended'],
      isPopular: snapshot['isPopular'],
      description: snapshot['description'],
    );

    return product;
  }

  static List<Product> products = [
    const Product(
      id: '1',
      name: 'iPhone 9',
      category: 'smartphones',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/1/thumbnail.jpg',
      price: 549,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '2',
      name: 'Samsung Universe 9',
      category: 'smartphones',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/3/thumbnail.jpg',
      price: 1249,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '3',
      name: 'OPPOF19',
      category: 'smartphones',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/4/thumbnail.jpg',
      price: 280,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '4',
      name: 'Huawei P30',
      category: 'smartphones',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/5/thumbnail.jpg',
      price: 499,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '5',
      name: 'MacBook Pro',
      category: 'laptops',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/6/thumbnail.png',
      price: 1749,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '6',
      name: 'Samsung Galaxy Book',
      category: 'laptops',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/7/thumbnail.jpg',
      price: 1499,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '7',
      name: 'Microsoft Surface Laptop 4',
      category: 'laptops',
      imageUrl: 'https://dummyjson.com/image/i/products/8/thumbnail.jpg',
      price: 1499,
      description: 'This is description',
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '8',
      name: 'HP Pavilion 15-DK1056WM',
      description: 'This is description',
      category: 'laptops',
      imageUrl: 'https://dummyjson.com/image/i/products/10/thumbnail.jpeg',
      price: 1099,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '9',
      name: 'Perfume Oil',
      description: 'This is description',
      category: 'fragrances',
      imageUrl: 'https://dummyjson.com/image/i/products/11/thumbnail.jpg',
      price: 13,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '10',
      name: 'Brown Perfume',
      category: 'fragrances',
      imageUrl: 'https://dummyjson.com/image/i/products/12/thumbnail.jpg',
      price: 40,
      description: 'This is description',
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '11',
      name: 'Fog Scent Xpressio Perfume',
      category: 'fragrances',
      imageUrl: 'https://dummyjson.com/image/i/products/13/thumbnail.webp',
      price: 13,
      description: 'This is description',
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '12',
      name: 'Non-Alcoholic Concentrated Perfume Oil',
      category: 'fragrances',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/14/thumbnail.jpg',
      price: 120,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '13',
      name: 'Hyaluronic Acid Serum',
      category: 'skincare',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/16/thumbnail.jpg',
      price: 19,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '14',
      name: 'Tree Oil 30ml',
      category: 'skincare',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/17/thumbnail.jpg',
      price: 12,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '15',
      name: 'Oil Free Moisturizer 100ml',
      category: 'skincare',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/18/thumbnail.jpg',
      price: 40,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '16',
      name: 'Skin Beauty Serum.',
      category: 'skincare',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/19/thumbnail.jpg',
      price: 46,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '17',
      name: 'Daal Masoor 500 grams',
      category: 'groceries',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/21/thumbnail.png',
      price: 20,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '18',
      name: 'Elbow Macaroni - 400 gm',
      category: 'groceries',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/22/thumbnail.jpg',
      price: 14,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '19',
      name: 'Orange Essence Food Flavou',
      category: 'groceries',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/23/thumbnail.jpg',
      price: 14,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '20',
      name: 'Gulab Powder 50 Gram',
      category: 'groceries',
      description: 'This is description',
      imageUrl: 'https://dummyjson.com/image/i/products/25/thumbnail.jpg',
      price: 70,
      isRecommended: true,
      isPopular: false,
    ),
  ];

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular, description];
}
