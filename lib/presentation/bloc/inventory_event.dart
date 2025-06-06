part of 'inventory_bloc.dart';

sealed class InventoryLoadEvent extends Equatable {
  const InventoryLoadEvent();
}

final class InventoryLoadStarted extends InventoryLoadEvent {
  const InventoryLoadStarted();

  @override
  List<Object?> get props => [];
}
