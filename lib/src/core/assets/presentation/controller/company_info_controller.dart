import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tractian_challenge/dependency_injection.dart';
import 'package:tractian_challenge/src/core/assets/domain/model/asset_model.dart';
import 'package:tractian_challenge/src/core/assets/domain/model/location_model.dart';
import 'package:tractian_challenge/src/core/assets/domain/use_case/get_company_info_use_case.dart';
import 'package:tractian_challenge/src/core/assets/domain/use_case/get_company_info_use_case_impl.dart';
import 'package:tractian_challenge/src/shared/tree_view/tree_view_model.dart';
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
  @observable
  List<TreeViewModel> _treeData = [];

  @computed
  List<TreeViewModel> get treeData => _treeData;

  @action
  Future<void> getLocations(String companyId) async {
    try {
      loading = true;
      _locations = await _getCompanyInfoUseCase.getLocations(companyId);
      getLocationTreeData();
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

  @action
  void getLocationTreeData() {
    _treeData = _locations.map((e) {
      return mapServerDataToTreeData(e);
    }).toList();
  }

  TreeViewModel mapServerDataToTreeData(LocationModel data) {
    return TreeViewModel(
      title: data.name,
      children: data.children != null
          ? List.from(data.children!.map((x) => mapServerDataToTreeData(x)))
          : [],
      prefix: 'assets/location.png',
    );
  }

  Icon? getSuffix(Map data) {
    if (data['status'] != null && (data['status'] as String) == 'alert') {
      return const Icon(Icons.error, color: Colors.red);
    } else if (data['sensorType'] != null && (data['sensorType'] as String) == 'energy') {
      return const Icon(Icons.bolt, color: Colors.blue);
    } else {
      return null;
    }
  }

  String getPrefix(Map data) {
    if (data['sensorType'] != null) {
      return 'assets/component.png';
    } else if (data['locationId'] != null) {
      return 'assets/asset.png';
    } else {
      return 'assets/location.png';
    }
  }
}
