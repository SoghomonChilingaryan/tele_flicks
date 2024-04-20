import 'package:json_annotation/json_annotation.dart';

part 'live_streams_response.g.dart';

@JsonSerializable()
class LiveStreamsResponse {
    @JsonKey(name: "num")
    final int num;
    @JsonKey(name: "name")
    final String name;
    @JsonKey(name: "stream_type")
    final String streamType;
    @JsonKey(name: "stream_id")
    final int streamId;
    @JsonKey(name: "stream_icon")
    final String streamIcon;
    @JsonKey(name: "epg_channel_id")
    final dynamic epgChannelId;
    @JsonKey(name: "added")
    final String added;
    @JsonKey(name: "custom_sid")
    final String customSid;
    @JsonKey(name: "tv_archive")
    final int tvArchive;
    @JsonKey(name: "direct_source")
    final String directSource;
    @JsonKey(name: "tv_archive_duration")
    final int tvArchiveDuration;
    @JsonKey(name: "category_id")
    final String categoryId;
    @JsonKey(name: "category_ids")
    final List<int> categoryIds;
    @JsonKey(name: "thumbnail")
    final String thumbnail;

    LiveStreamsResponse({
        required this.num,
        required this.name,
        required this.streamType,
        required this.streamId,
        required this.streamIcon,
        required this.epgChannelId,
        required this.added,
        required this.customSid,
        required this.tvArchive,
        required this.directSource,
        required this.tvArchiveDuration,
        required this.categoryId,
        required this.categoryIds,
        required this.thumbnail,
    });

    factory LiveStreamsResponse.fromJson(Map<String, dynamic> json) => _$LiveStreamsResponseFromJson(json);

    Map<String, dynamic> toJson() => _$LiveStreamsResponseToJson(this);
}
