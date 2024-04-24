// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_streams_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveStreamsResponse _$LiveStreamsResponseFromJson(Map<String, dynamic> json) =>
    LiveStreamsResponse(
      num: json['num'] as int,
      name: json['name'] as String,
      streamType: json['stream_type'] as String,
      streamId: json['stream_id'] as int,
      streamIcon: json['stream_icon'] as String,
      epgChannelId: json['epg_channel_id'],
      added: json['added'] as String,
      customSid: json['custom_sid'] as String,
      tvArchive: json['tv_archive'] as int,
      directSource: json['direct_source'] as String,
      tvArchiveDuration: json['tv_archive_duration'] as int,
      categoryId: json['category_id'] as String,
      categoryIds:
          (json['category_ids'] as List<dynamic>).map((e) => e as int).toList(),
      thumbnail: json['thumbnail'] as String,
    );
