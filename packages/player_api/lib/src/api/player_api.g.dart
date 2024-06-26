// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PlayerApi implements PlayerApi {
  _PlayerApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AuthenticationResponse> authentication(
    String userName,
    String password,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'username': userName,
      r'password': password,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/player_api.php',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AuthenticationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<LiveCategoriesResponse>> getLiveCategories(
      {String action = 'get_live_categories'}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'action': action};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<LiveCategoriesResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/player_api.php',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            LiveCategoriesResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<LiveStreamsResponse>> getLiveStreams(
      {String action = 'get_live_streams'}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'action': action};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<LiveStreamsResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/player_api.php',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            LiveStreamsResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<LiveStreamsResponse>> getLiveStreamsCategoryId({
    String action = 'get_live_streams',
    required String categoryId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'action': action,
      r'category_id': categoryId,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<LiveStreamsResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/player_api.php',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            LiveStreamsResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ShortEpgResponse> getShortEpg({
    String action = 'get_short_epg',
    required int streamId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'action': action,
      r'stream_id': streamId,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ShortEpgResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/player_api.php',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ShortEpgResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
