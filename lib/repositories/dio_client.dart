import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://670938acaf1a3998baa0cc62.mockapi.io/",
      ),
    );
  }
  // getter para acessar o dio
  Dio get dio {
    return _dio;
  }
}
