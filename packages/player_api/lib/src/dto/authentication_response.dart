import 'package:json_annotation/json_annotation.dart';

part 'authentication_response.g.dart';

enum UserState {
  unauthorized,
  authorized;

  static UserState? fromJson(int value) {
    switch (value) {
      case 0:
        return UserState.unauthorized;
      case 1:
        return UserState.authorized;
    }
    return null;
  }
}

@JsonSerializable(createToJson: false)
class AuthenticationResponse {
  @JsonKey(name: 'user_info')
  final UserInfo userInfo;
  @JsonKey(name: 'server_info')
  final ServerInfo serverInfo;

  AuthenticationResponse({
    required this.userInfo,
    required this.serverInfo,
  });

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserInfo {
  @JsonKey(name: 'username')
  final String userName;
  final String password;
  final String? message;
  @JsonKey(name: 'auth', fromJson: UserState.fromJson)
  final UserState? userState;
  final String status;
  final String? expDate;
  @JsonKey(name: 'is_trial')
  final String isTrial;
  @JsonKey(name: 'active_cons')
  final int activeCons;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'max_connections')
  final String maxConnections;
  @JsonKey(name: 'allowed_output_formats')
  final List<String> allowedOutputFormats;

  UserInfo({
    required this.userName,
    required this.password,
    this.message,
    required this.userState,
    required this.status,
    required this.expDate,
    required this.isTrial,
    required this.activeCons,
    required this.createdAt,
    required this.maxConnections,
    required this.allowedOutputFormats,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class ServerInfo {
  final bool xui;
  final String version;
  final int revision;
  final String url;
  final String port;
  @JsonKey(name: 'https_port')
  final String httpsPort;
  @JsonKey(name: 'server_protocol')
  final String serverProtocol;
  @JsonKey(name: 'rtmp_port')
  final String rtmpPort;
  @JsonKey(name: 'timestamp_now')
  final int timestampNow;
  @JsonKey(name: 'time_now')
  final String timeNow;
  final String timezone;

  ServerInfo({
    required this.xui,
    required this.version,
    required this.revision,
    required this.url,
    required this.port,
    required this.httpsPort,
    required this.serverProtocol,
    required this.rtmpPort,
    required this.timestampNow,
    required this.timeNow,
    required this.timezone,
  });

  factory ServerInfo.fromJson(Map<String, dynamic> json) =>
      _$ServerInfoFromJson(json);
}
