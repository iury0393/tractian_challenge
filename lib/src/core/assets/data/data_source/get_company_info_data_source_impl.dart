import 'package:dio/dio.dart';
import 'package:tractian_challenge/src/core/assets/data/data_source/get_company_info_data_source.dart';
import 'package:tractian_challenge/src/core/assets/domain/model/asset_model.dart';
import 'package:tractian_challenge/src/core/assets/domain/model/location_model.dart';
import 'package:tractian_challenge/src/shared/utils/custom_dio.dart';
import 'package:tractian_challenge/src/shared/utils/utils.dart';

class GetCompanyInfoDataSourceImpl implements GetCompanyInfoDataSource {
  final CustomDio dio;
  GetCompanyInfoDataSourceImpl({required this.dio});

  @override
  Future<List<AssetModel>> getAssets(String companyId) async {
    try {
      Response response;
      response = await dio.customGet('/companies/$companyId/assets');
      List<AssetModel> listResponse =
          (response.data as List).map((value) => AssetModel().fromJson(value)).toList();
      return listResponse;
    } catch (e) {
      kLogger.e(e);
      throw Exception();
    }
  }

  @override
  Future<List<LocationModel>> getLocations(String companyId) async {
    try {
      Response response;
      response = await dio.customGet('/companies/$companyId/locations');
      List<LocationModel> listResponse =
          (response.data as List).map((value) => LocationModel().fromJson(value)).toList();
      return listResponse;
    } catch (e) {
      kLogger.e(e);
      throw Exception();
    }
  }
}
