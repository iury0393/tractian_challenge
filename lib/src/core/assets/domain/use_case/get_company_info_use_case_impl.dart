import 'package:tractian_challenge/src/core/assets/data/repositories/get_company_info_repository_impl.dart';
import 'package:tractian_challenge/src/core/assets/domain/model/asset_model.dart';
import 'package:tractian_challenge/src/core/assets/domain/model/location_model.dart';
import 'package:tractian_challenge/src/core/assets/domain/use_case/get_company_info_use_case.dart';

class GetCompanyInfoUseCaseImpl implements GetCompanyInfoUseCase {
  final GetCompanyInfoRepositoryImpl getCompanyInfoRepositoryImpl;
  GetCompanyInfoUseCaseImpl({required this.getCompanyInfoRepositoryImpl});

  @override
  Future<List<AssetModel>> getAssets(String companyId) {
    return getCompanyInfoRepositoryImpl.getAssets(companyId);
  }

  @override
  Future<List<LocationModel>> getLocations(String companyId) {
    return getCompanyInfoRepositoryImpl.getLocations(companyId);
  }
}
