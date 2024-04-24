import 'package:json_annotation/json_annotation.dart';

part 'live_categories_response.g.dart';

@JsonSerializable(createToJson: false)
class LiveCategoriesResponse {
  @JsonKey(name: "category_id")
  final String categoryId;
  @JsonKey(name: "category_name")
  final String categoryName;
  @JsonKey(name: "parent_id")
  final int parentId;

  LiveCategoriesResponse({
    required this.categoryId,
    required this.categoryName,
    required this.parentId,
  });

  factory LiveCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveCategoriesResponseFromJson(json);
}
