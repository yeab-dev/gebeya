import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio dio;

  factory DioClient() {
    return _instance;
  }
  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://fakestoreapi.com/",
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {"Content-Type": "application/json"},
      ),
    );
  }
}
