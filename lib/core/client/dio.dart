import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Future<Response> getIt(
  String url,
) async {
  Logger().i(url);
  final resp = await Dio().get(
    url,
    options: Options(
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
    ),
  );
  Logger().d(resp.data);
  return resp;
}
