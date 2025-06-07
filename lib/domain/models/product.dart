import 'package:gebeya/domain/models/product_category.dart';
import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final num price;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final ProductCategory category;

  @HiveField(5)
  final String image;

  static ProductCategory fromString(String value) {
    switch (value) {
      case "men's clothing":
        return ProductCategory.men;
      case "women's clothing":
        return ProductCategory.women;
      case "jewelery":
        return ProductCategory.jewelery;
      case "electronics":
        return ProductCategory.electronics;
      default:
        return ProductCategory.men;
    }
  }

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: fromString(json['category']),
      image: json['image'],
    );
  }
}
