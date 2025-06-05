import 'package:dio/dio.dart';
import 'package:gebeya/domain/models/cart.dart';

class CartFetchingService {
  final Dio dio;
  final String _cartEndpoint = "carts";

  CartFetchingService({required this.dio});

  Future<List<Cart>> fetchAllCarts() async {
    try {
      final response = await dio.get(_cartEndpoint);

      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((cartJson) => Cart.fromJson(cartJson))
            .toList();
      } else {
        throw Exception("Unexpected response format");
      }
    } catch (e) {
      throw Exception("Failed to fetch carts: $e");
    }
  }

  Future<Cart> getCartByID(int id) async {
    try {
      final response = await dio.get("$_cartEndpoint/$id");

      if (response.statusCode == 200 && response.data != null) {
        return Cart.fromJson(response.data);
      } else {
        throw Exception("Cart not found");
      }
    } catch (e) {
      throw Exception("Failed to fetch cart by ID: $e");
    }
  }
}
