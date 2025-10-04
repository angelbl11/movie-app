import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'custom_dio_controller.g.dart';

@Riverpod(keepAlive: true)
class CustomDioController extends _$CustomDioController {
  @override
  Dio build() {
    final dio = Dio();
    const String apiUrl = String.fromEnvironment('API_URL');
    const String token = String.fromEnvironment('API_KEY');

    dio.options.baseUrl = apiUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
