part of 'inventory_bloc.dart';

sealed class InventoryEvent extends Equatable {
  const InventoryEvent();
}

final class InventoryLoadStarted extends InventoryEvent {
  const InventoryLoadStarted();

  @override
  List<Object?> get props => [];
}

final class InventoryFilterByCategoryStarted extends InventoryEvent {
  final ProductCategory productCategory;
  const InventoryFilterByCategoryStarted({required this.productCategory});
  @override
  List<Object?> get props => [productCategory];
}

final class InventoryFilterBySearchStarted extends InventoryEvent {
  final String searchQuery;
  const InventoryFilterBySearchStarted({required this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}
