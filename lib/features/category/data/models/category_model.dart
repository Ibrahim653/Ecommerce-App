import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryResponse {
  final List<Category> results;

  CategoryResponse({required this.results});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);
}

@JsonSerializable()
class Category {
  final int id;
  final String name;
  @JsonKey(name: 'image_link')
  final String imageLink;

  Category({required this.id, required this.name, required this.imageLink});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
