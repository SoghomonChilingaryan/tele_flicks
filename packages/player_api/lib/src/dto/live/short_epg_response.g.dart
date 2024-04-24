// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_epg_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortEpgResponse _$ShortEpgResponseFromJson(Map<String, dynamic> json) =>
    ShortEpgResponse(
      epgListings: (json['epg_listings'] as List<dynamic>)
          .map((e) => EpgListing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

EpgListing _$EpgListingFromJson(Map<String, dynamic> json) => EpgListing(
      id: json['id'] as String,
      epgId: json['epg_id'] as String,
      title: json['title'] as String,
      lang: json['lang'] as String,
      start: DateTime.parse(json['start'] as String),
      end: json['end'] as String,
      description: json['description'] as String,
      channelId: json['channel_id'] as String,
      startTimestamp: json['start_timestamp'] as String,
      stopTimestamp: json['stop_timestamp'] as String,
      stop: DateTime.parse(json['stop'] as String),
    );
