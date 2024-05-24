// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      imageLink: json['image_link'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_link': instance.imageLink,
    };

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      imageLink: json['image_link'] as String?,
      price: json['price'] as String?,
      description: json['description'] as String?,
      rate: json['rate'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_link': instance.imageLink,
      'price': instance.price,
      'description': instance.description,
      'rate': instance.rate,
      'category': instance.category,
    };
