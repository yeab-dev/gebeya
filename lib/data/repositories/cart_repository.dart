import 'package:gebeya/data/services/cart_fetching_service.dart';
import 'package:gebeya/domain/models/cart.dart';

abstract class CartRepository {
  Future<List<Cart>> getAllCarts();
  Future<Cart> getCartById(int id);
}

class CartRepositoryImpl implements CartRepository {
  final CartFetchingService cartFetchingService;

  CartRepositoryImpl({required this.cartFetchingService});

  @override
  Future<List<Cart>> getAllCarts() async {
    try {
      final carts = await cartFetchingService.fetchAllCarts();
      return carts;
    } catch (e) {
      throw Exception('Failed to load carts: $e');
    }
  }

  @override
  Future<Cart> getCartById(int id) async {
    try {
      final cart = await cartFetchingService.getCartByID(id);
      return cart;
    } catch (e) {
      throw Exception('Failed to load cart with ID $id: $e');
    }
  }
}
