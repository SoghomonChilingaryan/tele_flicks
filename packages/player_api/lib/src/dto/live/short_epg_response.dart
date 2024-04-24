import 'package:json_annotation/json_annotation.dart';

part 'short_epg_response.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ShortEpgResponse {
  @JsonKey(name: "epg_listings")
  final List<EpgListing> epgListings;

  ShortEpgResponse({
    required this.epgListings,
  });

  factory ShortEpgResponse.fromJson(Map<String, dynamic> json) =>
      _$ShortEpgResponseFromJson(json);

}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class EpgListing {
  final String id;
  final String epgId;
  final String title;
  final String lang;
  final DateTime start;
  final String end;
  final String description;
  final String channelId;
  final String startTimestamp;
  final String stopTimestamp;
  final DateTime stop;

  EpgListing({
    required this.id,
    required this.epgId,
    required this.title,
    required this.lang,
    required this.start,
    required this.end,
    required this.description,
    required this.channelId,
    required this.startTimestamp,
    required this.stopTimestamp,
    required this.stop,
  });

  factory EpgListing.fromJson(Map<String, dynamic> json) =>
      _$EpgListingFromJson(json);

}
