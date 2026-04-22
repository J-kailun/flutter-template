import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  final int stock;
  final String image;
  final List<String> images;
  final int categoryId;
  final String categoryName;
  final double rating;
  final int reviewCount;
  final bool isFeatured;
  final bool isNew;
  final bool isOnSale;
  final String createdAt;
  final String updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.stock,
    required this.image,
    required this.images,
    required this.categoryId,
    required this.categoryName,
    required this.rating,
    required this.reviewCount,
    required this.isFeatured,
    required this.isNew,
    required this.isOnSale,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, price: $price)';
  }
}
