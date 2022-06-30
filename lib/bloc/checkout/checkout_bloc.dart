import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/bloc/blocs.dart';
import '../../models/model.dart';
import '../../repositories/repositories.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final PaymentBloc _paymentBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _streamCartBlocSubscription;
  StreamSubscription? _streamPaymentBlocSubscription;
  StreamSubscription? _streamCheckoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required PaymentBloc paymentBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _paymentBloc = paymentBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subTotal:
                    (cartBloc.state as CartLoaded).cart.subTotalPriceString,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalPriceString,
              )
            : CheckoutLoading()) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);

    _streamCartBlocSubscription = _cartBloc.stream.listen((event) {
      if (event is CartLoaded) {
        add(UpdateCheckout(cart: (state as CartLoaded).cart));
      }
    });

    _streamPaymentBlocSubscription = _paymentBloc.stream.listen((state) {
      if (state is PaymentLoaded) {
        add(
          UpdateCheckout(
            paymentMethod: state.paymentMethod,
          ),
        );
      }
    });
  }

  void _onUpdateCheckout(event, Emitter<CheckoutState> emit) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      emit(CheckoutLoaded(
        name: event.name ?? state.name,
        email: event.email ?? state.email,
        address: event.address ?? state.address,
        city: event.city ?? state.city,
        country: event.country ?? state.country,
        zipCode: event.zipCode ?? state.zipCode,
        subTotal: event.subTotal ?? state.subTotal,
        deliveryFee: event.deliveryFee ?? state.deliveryFee,
        total: event.total ?? state.total,
        products: event.cart?.products ?? state.products,
        paymentMethod: event.paymentMethod ?? state.paymentMethod,
      ));
    }
  }

  void _onConfirmCheckout(event, Emitter<CheckoutState> emit) async {
    _streamCheckoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        emit(CheckoutLoading());
      } catch (_) {}
    }
  }

  @override
  Future<void> close() {
    _streamCartBlocSubscription?.cancel();
    _streamPaymentBlocSubscription?.cancel();
    return super.close();
  }
}
