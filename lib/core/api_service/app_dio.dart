import 'package:dio/dio.dart';

abstract class APIDio {
  static final _dio = _getDio();
  static Dio get instance => _dio;
  static Dio _getDio() {
    // api dio object
    final options = BaseOptions(
      baseUrl: 'https://api.vision11.org/api/',
    );
    return Dio(options);
  }
}
