import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

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
class Product {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  Product({this.count, this.next, this.previous, this.results});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

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
