import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gebeya/data/repositories/cart_repository.dart';
import 'package:gebeya/data/repositories/product_repository.dart';
import 'package:gebeya/domain/models/cart.dart';
import 'package:gebeya/domain/models/product.dart';
import 'package:gebeya/domain/models/product_category.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final ProductRepository productRepository;
  final CartRepository cartRepository;

  List<Product> _allProducts = [];

  InventoryBloc({required this.cartRepository, required this.productRepository})
    : super(InventoryLoadInitial()) {
    on<InventoryLoadStarted>(_onLoadStarted);
    on<InventoryFilterByCategoryStarted>(_onFilterByCategoryStarted);
    on<InventoryFilterBySearchStarted>(_onFilterBySearchStarted);
  }

  Future<void> _onLoadStarted(
    InventoryLoadStarted event,
    Emitter<InventoryState> emit,
  ) async {
    emit(InventoryLoadInProgress());

    try {
      final cart = await cartRepository.getCart();
      final products = await productRepository.getAllProducts();
      _allProducts = products;
      emit(
        InventoryLoadSuccess(
          cart: cart ?? Cart(id: "cart", products: []),
          products: products,
          category: ProductCategory.all,
        ),
      );
    } catch (e) {
      emit(InventoryLoadFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onFilterByCategoryStarted(
    InventoryFilterByCategoryStarted event,
    Emitter<InventoryState> emit,
  ) async {
    final cart = await cartRepository.getCart();
    final filteredProducts = event.productCategory == ProductCategory.all
        ? _allProducts
        : _allProducts.where((product) {
            return product.category == event.productCategory;
          }).toList();

    emit(
      InventoryLoadSuccess(
        products: filteredProducts,
        cart: cart ?? Cart(id: "cart", products: []),
        category: event.productCategory,
      ),
    );
  }

  Future<void> _onFilterBySearchStarted(
    InventoryFilterBySearchStarted event,
    Emitter<InventoryState> emit,
  ) async {
    final cart = await cartRepository.getCart();
    final query = event.searchQuery.trim().toLowerCase();

    final filteredProducts = query.isEmpty
        ? _allProducts
        : _allProducts.where((product) {
            return product.title.toLowerCase().contains(query) ||
                product.description.toLowerCase().contains(query);
          }).toList();

    emit(
      InventoryLoadSuccess(
        products: filteredProducts,
        cart: cart ?? Cart(id: "cart", products: []),
        category: ProductCategory.all,
      ),
    );
  }
}
