import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tractian_challenge/src/shared/utils/utils.dart';

Logger logger = Logger();

class CustomDio {
  final Dio dio;
  CustomDio(this.dio) {
    dio.options.baseUrl = kBaseURL;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.interceptors.add(AwesomeDioInterceptor());
  }

  Future<Response> customGet(String path) async {
    Response response;
    response = await dio.get(path);
    return response;
  }
}
