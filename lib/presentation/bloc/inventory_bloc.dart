import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gebeya/data/repositories/cart_repository.dart';
import 'package:gebeya/data/repositories/product_repository.dart';
import 'package:gebeya/domain/models/cart.dart';
import 'package:gebeya/domain/models/product.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryLoadEvent, InventoryState> {
  ProductRepository productRepository;
  CartRepository cartRepository;
  InventoryBloc({required this.cartRepository, required this.productRepository})
    : super((InventoryLoadInitial())) {
    on<InventoryLoadStarted>(_onLoadStarted);
  }
  Future<void> _onLoadStarted(
    InventoryLoadStarted event,
    Emitter<InventoryState> emit,
  ) async {
    emit(InventoryLoadInProgress());

    try {
      final cart = await cartRepository.getCart();
      final products = await productRepository.getAllProducts();
      emit(
        InventoryLoadSuccess(
          cart: cart ?? Cart(id: "cart", products: []),
          products: products,
        ),
      );
    } catch (e) {
      emit(InventoryLoadFailure(errorMessage: e.toString()));
    }
  }
}
