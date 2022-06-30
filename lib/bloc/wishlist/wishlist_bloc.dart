import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishList>(_onLoadWishlist);
    on<AddWishListProduct>(_onAddWishListProduct);
    on<RemoveWishListProduct>(_onRemoveWishListProduct);
  }

  void _onLoadWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded());
    } on Exception {
      emit(WishlistError());
    }
  }

  void _onAddWishListProduct(event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishList: WishList(
              products: List.from(state.wishList.products)..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveWishListProduct(event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishList: WishList(
            products: List.from(state.wishList.products)..remove(event.product),
          ),
        ));
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}
