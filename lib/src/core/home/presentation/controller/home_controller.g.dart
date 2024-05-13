// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<HomeModel>? _$jaguarDataComputed;

  @override
  HomeModel get jaguarData =>
      (_$jaguarDataComputed ??= Computed<HomeModel>(() => super.jaguarData,
              name: '_HomeControllerBase.jaguarData'))
          .value;
  Computed<HomeModel>? _$tobiasDataComputed;

  @override
  HomeModel get tobiasData =>
      (_$tobiasDataComputed ??= Computed<HomeModel>(() => super.tobiasData,
              name: '_HomeControllerBase.tobiasData'))
          .value;
  Computed<HomeModel>? _$apexDataComputed;

  @override
  HomeModel get apexData =>
      (_$apexDataComputed ??= Computed<HomeModel>(() => super.apexData,
              name: '_HomeControllerBase.apexData'))
          .value;

  late final _$loadingAtom =
      Atom(name: '_HomeControllerBase.loading', context: context);

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
      Atom(name: '_HomeControllerBase.error', context: context);

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

  late final _$_listAtom =
      Atom(name: '_HomeControllerBase._list', context: context);

  @override
  List<HomeModel> get _list {
    _$_listAtom.reportRead();
    return super._list;
  }

  @override
  set _list(List<HomeModel> value) {
    _$_listAtom.reportWrite(value, super._list, () {
      super._list = value;
    });
  }

  late final _$getCompaniesAsyncAction =
      AsyncAction('_HomeControllerBase.getCompanies', context: context);

  @override
  Future<void> getCompanies() {
    return _$getCompaniesAsyncAction.run(() => super.getCompanies());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
jaguarData: ${jaguarData},
tobiasData: ${tobiasData},
apexData: ${apexData}
    ''';
  }
}
