import 'package:dio/dio.dart';
import 'package:gebeya/domain/models/product.dart';

class ProductService {
  const ProductService({required this.dio});
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
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection Timeout");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Server not responding");
      } else {
        throw Exception("Unknown Error");
      }
    } catch (e) {
      throw Exception("Failed to fetch products: $e");
    }
  }
}
