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
        super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<UpdateProducts>(_onUpdateProducts);
  }

  void _onLoadProducts(event, Emitter<ProductState> emit) {
    _streamProductSubscription?.cancel();
    _streamProductSubscription =
        _productRepository.getAllProducts().listen((products) {
      return add(UpdateProducts(products));
    });
  }

  void _onUpdateProducts(event, Emitter<ProductState> emit) {
    emit(ProductLoaded(products: event.products));
  }
}
