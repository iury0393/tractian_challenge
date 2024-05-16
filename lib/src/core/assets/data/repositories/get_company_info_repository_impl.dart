import 'package:tractian_challenge/src/core/assets/data/data_source/get_company_info_data_source.dart';
import 'package:tractian_challenge/src/core/assets/domain/model/asset_model.dart';
import 'package:tractian_challenge/src/core/assets/domain/model/location_model.dart';
import 'package:tractian_challenge/src/core/assets/domain/repositories/get_company_info_repository.dart';

class GetCompanyInfoRepositoryImpl implements GetCompanyInfoRepository {
  final GetCompanyInfoDataSource getCompanyInfoDataSource;
  GetCompanyInfoRepositoryImpl({required this.getCompanyInfoDataSource});
  @override
  Future<List<AssetModel>> getAssets(String companyId) {
    return getCompanyInfoDataSource.getAssets(companyId);
  }

  @override
  Future<List<LocationModel>> getLocations(String companyId) {
    return getCompanyInfoDataSource.getLocations(companyId);
  }
}
