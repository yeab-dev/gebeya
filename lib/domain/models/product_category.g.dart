// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCategoryAdapter extends TypeAdapter<ProductCategory> {
  @override
  final int typeId = 3;

  @override
  ProductCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ProductCategory.men;
      case 1:
        return ProductCategory.women;
      case 2:
        return ProductCategory.jewelery;
      case 3:
        return ProductCategory.electronics;
      case 4:
        return ProductCategory.all;
      default:
        return ProductCategory.men;
    }
  }

  @override
  void write(BinaryWriter writer, ProductCategory obj) {
    switch (obj) {
      case ProductCategory.men:
        writer.writeByte(0);
        break;
      case ProductCategory.women:
        writer.writeByte(1);
        break;
      case ProductCategory.jewelery:
        writer.writeByte(2);
        break;
      case ProductCategory.electronics:
        writer.writeByte(3);
        break;
      case ProductCategory.all:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
