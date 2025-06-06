import 'package:gebeya/data/services/cart_service.dart';
import 'package:gebeya/domain/models/cart.dart';

abstract class CartRepository {
  const CartRepository();
  Future<void> saveCart(Cart cart);
  Future<Cart?> getCart();
}

class CartRepositoryImpl extends CartRepository {
  final CartService service;
  const CartRepositoryImpl({required this.service});

  @override
  Future<void> saveCart(Cart cart) async {
    await service.saveCart(cart);
  }

  @override
  Future<Cart?> getCart() async {
    return await service.getCart();
  }
}
