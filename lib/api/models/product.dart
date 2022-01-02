import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class Product {
  String name;
  List<Assets>? assets;
  FeaturedAsset? featuredAsset;

  Product({required this.name, this.assets, this.featuredAsset});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@JsonSerializable(createToJson: false)
class Assets {
  String? preview;

  Assets({this.preview});

  factory Assets.fromJson(Map<String, dynamic> json) => _$AssetsFromJson(json);

}

@JsonSerializable(createToJson: false)
class FeaturedAsset {
  String? preview;
  String? source;

  FeaturedAsset({this.preview, this.source});

  factory FeaturedAsset.fromJson(Map<String, dynamic> json) =>
      _$FeaturedAssetFromJson(json);
}
