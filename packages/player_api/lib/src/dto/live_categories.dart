import 'package:json_annotation/json_annotation.dart';

part 'live_categories.g.dart';

@JsonSerializable(createToJson: false)
class LiveCategories {
    @JsonKey(name: "category_id")
    final String categoryId;
    @JsonKey(name: "category_name")
    final String categoryName;
    @JsonKey(name: "parent_id")
    final int parentId;

    LiveCategories({
        required this.categoryId,
        required this.categoryName,
        required this.parentId,
    });

    factory LiveCategories.fromJson(Map<String, dynamic> json) => _$LiveCategoriesFromJson(json);

}