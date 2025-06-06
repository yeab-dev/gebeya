import 'package:gebeya/domain/models/cart.dart';
import 'package:hive_flutter/adapters.dart';

class CartService {
  final Box box = Hive.box('inventory');
  Future<void> saveCart(Cart cart) async {
    await box.put("cart", cart);
  }

  Future<Cart?> getCart() async {
    return await box.get("cart");
  }
}
