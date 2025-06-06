import 'package:gebeya/data/services/product_fetching_service.dart';
import 'package:gebeya/domain/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById(int id);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductFetchingService service;
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

  @override
  Future<Product> getProductById(int id) {
    try {
      final product = service.getProductByID(id);
      return product;
    } catch (e) {
      throw Exception('Failed to load product with ID $id: $e');
    }
  }
}
