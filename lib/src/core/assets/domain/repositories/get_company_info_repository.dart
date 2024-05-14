import 'package:tractian_challenge/src/core/assets/domain/model/asset_model.dart';
import 'package:tractian_challenge/src/core/assets/domain/model/location_model.dart';

abstract class GetCompanyInfoRepository {
  Future<List<LocationModel>> getLocations(String companyId);
  Future<List<AssetModel>> getAssets(String companyId);
}
