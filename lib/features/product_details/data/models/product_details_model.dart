import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel {
  final int id;
  final String name;

  @JsonKey(name: 'image_link')
  final String imageLink;

  final String price;
  final String description;
  final String rate;
  final Category category;

  ProductDetailsModel({
    required this.id,
    required this.name,
    required this.imageLink,
    required this.price,
    required this.description,
    required this.rate,
    required this.category,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
}

@JsonSerializable()
class Category {
  final int id;
  final String name;

  @JsonKey(name: 'image_link')
  final String imageLink;

  Category({
    required this.id,
    required this.name,
    required this.imageLink,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
