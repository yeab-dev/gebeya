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
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection Timeout");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Server not responding");
      } else {
        throw Exception("Unknown Error");
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
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection Timeout");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Server not responding");
      } else {
        throw Exception("Unknown Error");
      }
    } catch (e) {
      throw Exception("Failed to fetch cart by ID: $e");
    }
  }
}
