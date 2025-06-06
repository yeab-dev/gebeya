import 'package:dio/dio.dart';
import 'package:gebeya/domain/models/product.dart';

class ProductFetchingService {
  const ProductFetchingService({required this.dio});
  final String _productEndpoint = 'products';
  final Dio dio;

  Future<List<Product>> fetchAllProducts() async {
    try {
      final response = await dio.get(_productEndpoint);
      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        throw Exception("Unexpected Response Format");
      }
    } catch (e) {
      throw Exception("Failed to fetch products: $e");
    }
  }

  Future<Product> getProductByID(int id) async {
    try {
      final response = await dio.get("$_productEndpoint/$id");
      if (response.statusCode == 200 && response.data != null) {
        return Product.fromJson(response.data);
      } else {
        throw Exception("Unexpected Response Format");
      }
    } catch (e) {
      throw Exception("Failed to fetch product by ID: $e");
    }
  }
}
