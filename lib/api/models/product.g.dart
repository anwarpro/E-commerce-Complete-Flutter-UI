// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    name: json['name'] as String,
    assets: (json['assets'] as List<dynamic>?)
        ?.map((e) => Assets.fromJson(e as Map<String, dynamic>))
        .toList(),
    featuredAsset: json['featuredAsset'] == null
        ? null
        : FeaturedAsset.fromJson(json['featuredAsset'] as Map<String, dynamic>),
  );
}

Assets _$AssetsFromJson(Map<String, dynamic> json) {
  return Assets(
    preview: json['preview'] as String?,
  );
}

FeaturedAsset _$FeaturedAssetFromJson(Map<String, dynamic> json) {
  return FeaturedAsset(
    preview: json['preview'] as String?,
    source: json['source'] as String?,
  );
}
