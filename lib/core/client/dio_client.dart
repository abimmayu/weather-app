import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  Future<Response> get(String url) async {
    final resp = await _dio.get(
      url,
    );
    return resp;
  }
}
