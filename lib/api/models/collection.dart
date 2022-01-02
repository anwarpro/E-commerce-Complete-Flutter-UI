import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

/// id : "2"
/// name : "Electronics"
/// slug : "electronics"

@JsonSerializable(createToJson: false)
class Collection {
  const Collection({required this.id, required this.name, required this.slug});

  final String id;
  final String name;
  final String slug;

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}
