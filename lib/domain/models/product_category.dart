import 'package:hive_flutter/adapters.dart';

part 'product_category.g.dart';

@HiveType(typeId: 3)
enum ProductCategory {
  @HiveField(0)
  men,
  @HiveField(1)
  women,
  @HiveField(2)
  jewelery,
  @HiveField(3)
  electronics,
  @HiveField(4)
  all,
}
