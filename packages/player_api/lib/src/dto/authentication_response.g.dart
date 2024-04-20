// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      userInfo: UserInfo.fromJson(json['user_info'] as Map<String, dynamic>),
      serverInfo:
          ServerInfo.fromJson(json['server_info'] as Map<String, dynamic>),
    );

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      userName: json['username'] as String,
      password: json['password'] as String,
      message: json['message'] as String?,
      userState: UserState.fromJson(json['auth'] as int),
      status: json['status'] as String,
      expDate: json['expDate'] as String?,
      isTrial: json['is_trial'] as String,
      activeCons: json['active_cons'] as int,
      createdAt: json['created_at'] as String,
      maxConnections: json['max_connections'] as String,
      allowedOutputFormats: (json['allowed_output_formats'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

ServerInfo _$ServerInfoFromJson(Map<String, dynamic> json) => ServerInfo(
      xui: json['xui'] as bool,
      version: json['version'] as String,
      revision: json['revision'] as int,
      url: json['url'] as String,
      port: json['port'] as String,
      httpsPort: json['https_port'] as String,
      serverProtocol: json['server_protocol'] as String,
      rtmpPort: json['rtmp_port'] as String,
      timestampNow: json['timestamp_now'] as int,
      timeNow: json['time_now'] as String,
      timezone: json['timezone'] as String,
    );
