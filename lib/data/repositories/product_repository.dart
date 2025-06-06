import 'package:gebeya/data/services/product_service.dart';
import 'package:gebeya/domain/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductService service;
  ProductRepositoryImpl({required this.service});

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      final products = await service.fetchAllProducts();
      return products;
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
