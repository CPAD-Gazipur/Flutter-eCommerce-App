import 'package:equatable/equatable.dart';
import 'model.dart';

class WishList extends Equatable {
  final List<Product> products;

  const WishList({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];
}
