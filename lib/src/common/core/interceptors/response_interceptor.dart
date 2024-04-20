import 'package:dio/dio.dart';

class ResponseConverter extends Interceptor {
  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('data')) {
      final dataJson = data['data'];
      if (dataJson is Map<String, dynamic>) {
        response.data = dataJson;
      }
    }
    handler.resolve(response);
    return response;
  }
}
