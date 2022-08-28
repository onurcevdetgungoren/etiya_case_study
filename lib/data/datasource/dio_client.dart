import 'package:dio/dio.dart';

class DioClient {
  Dio dio = Dio(); // with default Options

  DioClient() {
    setupDio();
  }

  setupDio() async {
    dio.options.baseUrl = "https://api.rawg.io/api/";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 50000;
  }
}
