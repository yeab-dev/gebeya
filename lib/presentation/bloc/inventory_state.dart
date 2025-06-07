part of 'inventory_bloc.dart';

sealed class InventoryState extends Equatable {
  const InventoryState();
}

final class InventoryLoadInitial extends InventoryState {
  @override
  List<Object?> get props => [];
}

final class InventoryLoadInProgress extends InventoryState {
  @override
  List<Object?> get props => [];
}

final class InventoryLoadSuccess extends InventoryState {
  final Cart cart;
  final List<Product> products;
  final ProductCategory category;
  const InventoryLoadSuccess({
    required this.cart,
    required this.products,
    required this.category,
  });

  @override
  List<Object?> get props => [cart, products];
}

final class InventoryLoadFailure extends InventoryState {
  final String errorMessage;
  const InventoryLoadFailure({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
