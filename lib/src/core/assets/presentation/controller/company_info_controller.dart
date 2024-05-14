import 'package:mobx/mobx.dart';
import 'package:tractian_challenge/dependency_injection.dart';
import 'package:tractian_challenge/src/core/assets/domain/model/asset_model.dart';
import 'package:tractian_challenge/src/core/assets/domain/model/location_model.dart';
import 'package:tractian_challenge/src/core/assets/domain/use_case/get_company_info_use_case.dart';
import 'package:tractian_challenge/src/core/assets/domain/use_case/get_company_info_use_case_impl.dart';
import 'package:tractian_challenge/src/shared/utils/utils.dart';
part 'company_info_controller.g.dart';

class CompanyInfoController = _CompanyInfoControllerBase with _$CompanyInfoController;

abstract class _CompanyInfoControllerBase with Store {
  final GetCompanyInfoUseCase _getCompanyInfoUseCase = getIt<GetCompanyInfoUseCaseImpl>();

  @observable
  bool loading = false;
  @observable
  bool error = false;

  @observable
  List<LocationModel> _locations = [];
  @observable
  List<AssetModel> _assets = [];

  @action
  Future<void> getLocations(String companyId) async {
    try {
      loading = true;
      _locations = await _getCompanyInfoUseCase.getLocations(companyId);
      for (int i = 0; i < _locations.length; i++) {
        for (int j = 0; j < _locations.length; j++) {
          if (_locations[i].id == _locations[j].parentId) {
            _locations[i].children?.add(_locations[j]);
          }
          _locations.removeWhere(
            (element) => _locations[i].id == _locations[j].parentId,
          );
        }
      }
      loading = false;
    } catch (e) {
      kLogger.e(e);
      error = true;
    }
  }

  @action
  Future<void> getAssets(String companyId) async {
    try {
      loading = true;
      _assets = await _getCompanyInfoUseCase.getAssets(companyId);
      loading = false;
    } catch (e) {
      kLogger.e(e);
      error = true;
    }
  }
}
