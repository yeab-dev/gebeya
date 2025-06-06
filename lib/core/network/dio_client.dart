import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;

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
