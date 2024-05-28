import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class Category {
  int? id;
  String? name;
  @JsonKey(name: 'image_link')
  String? imageLink;

  Category({this.id, this.name, this.imageLink});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

}

@JsonSerializable()
class ProductsModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  ProductsModel({this.count, this.next, this.previous, required this.results});

  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);

}

@JsonSerializable()
class Result {
  int? id;
  String? name;
  @JsonKey(name: 'image_link')
  String? imageLink;
  String? price;
  String? description;
  String? rate;
  Category? category;

  Result({
    this.id,
    this.name,
    this.imageLink,
    this.price,
    this.description,
    this.rate,
    this.category,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

}
