import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/model.dart';
import '../../repositories/repositories.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _streamProductSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProductsToState();
    } else if (event is UpdateProducts) {
      yield* _mapUpdateProductsToState(event);
    }
  }

  Stream<ProductState> _mapLoadProductsToState() async* {
    _streamProductSubscription?.cancel();
    _streamProductSubscription =
        _productRepository.getAllProducts().listen((products) {
      return add(UpdateProducts(products));
    });
  }

  Stream<ProductState> _mapUpdateProductsToState(
    UpdateProducts event,
  ) async* {
    yield ProductLoaded(products: event.products);
  }
}
