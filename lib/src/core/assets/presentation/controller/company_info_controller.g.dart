// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompanyInfoController on _CompanyInfoControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_CompanyInfoControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_CompanyInfoControllerBase.error', context: context);

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$_locationsAtom =
      Atom(name: '_CompanyInfoControllerBase._locations', context: context);

  @override
  List<LocationModel> get _locations {
    _$_locationsAtom.reportRead();
    return super._locations;
  }

  @override
  set _locations(List<LocationModel> value) {
    _$_locationsAtom.reportWrite(value, super._locations, () {
      super._locations = value;
    });
  }

  late final _$_assetsAtom =
      Atom(name: '_CompanyInfoControllerBase._assets', context: context);

  @override
  List<AssetModel> get _assets {
    _$_assetsAtom.reportRead();
    return super._assets;
  }

  @override
  set _assets(List<AssetModel> value) {
    _$_assetsAtom.reportWrite(value, super._assets, () {
      super._assets = value;
    });
  }

  late final _$getLocationsAsyncAction =
      AsyncAction('_CompanyInfoControllerBase.getLocations', context: context);

  @override
  Future<void> getLocations(String companyId) {
    return _$getLocationsAsyncAction.run(() => super.getLocations(companyId));
  }

  late final _$getAssetsAsyncAction =
      AsyncAction('_CompanyInfoControllerBase.getAssets', context: context);

  @override
  Future<void> getAssets(String companyId) {
    return _$getAssetsAsyncAction.run(() => super.getAssets(companyId));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error}
    ''';
  }
}
