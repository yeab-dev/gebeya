import 'package:gebeya/data/services/local/cart_service_local.dart';
import 'package:gebeya/domain/models/cart.dart';

class CartRepoLocal {
  final CartServiceLocal service;
  const CartRepoLocal({required this.service});

  Future<void> saveCart(Cart cart) async {
    await service.saveCart(cart);
  }

  Future<Cart?> getCart() async {
    return await service.getCart();
  }
}
