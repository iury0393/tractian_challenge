import 'package:dio/dio.dart';
import 'package:tractian_challenge/src/core/home/data/data_source/home_data_souce.dart';
import 'package:tractian_challenge/src/core/home/domain/model/home_model.dart';
import 'package:tractian_challenge/src/shared/utils/custom_dio.dart';
import 'package:tractian_challenge/src/shared/utils/utils.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final CustomDio dio;
  HomeDataSourceImpl({required this.dio});

  @override
  Future<List<HomeModel>> getCompanies() async {
    try {
      Response response;
      response = await dio.customGet('/companies');
      List<HomeModel> listResponse =
          (response.data as List).map((value) => HomeModel().fromJson(value)).toList();
      return listResponse;
    } catch (e) {
      kLogger.e(e);
      throw Exception();
    }
  }
}
