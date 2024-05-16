import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tractian_challenge/src/core/assets/data/data_source/get_company_info_data_source_impl.dart';
import 'package:tractian_challenge/src/core/assets/data/repositories/get_company_info_repository_impl.dart';
import 'package:tractian_challenge/src/core/assets/domain/use_case/get_company_info_use_case_impl.dart';
import 'package:tractian_challenge/src/core/home/data/data_source/home_data_souce_impl.dart';
import 'package:tractian_challenge/src/core/home/data/repositories/home_repository_impl.dart';
import 'package:tractian_challenge/src/core/home/domain/use_case/home_use_case_impl.dart';
import 'package:tractian_challenge/src/shared/utils/custom_dio.dart';

GetIt getIt = GetIt.instance;

void setup() {
  //GLOBAL
  getIt.registerFactory(() => Dio());

  getIt.registerSingleton<CustomDio>(CustomDio(getIt<Dio>()));

  //DATA SOURCE
  getIt.registerSingleton<HomeDataSourceImpl>(HomeDataSourceImpl(
    dio: getIt<CustomDio>(),
  ));
  getIt.registerSingleton<GetCompanyInfoDataSourceImpl>(GetCompanyInfoDataSourceImpl(
    dio: getIt<CustomDio>(),
  ));

  //REPOSITORIES
  getIt.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl(
    homeDataSource: getIt<HomeDataSourceImpl>(),
  ));
  getIt.registerSingleton<GetCompanyInfoRepositoryImpl>(GetCompanyInfoRepositoryImpl(
    getCompanyInfoDataSource: getIt<GetCompanyInfoDataSourceImpl>(),
  ));

  //USE CASE
  getIt.registerSingleton<HomeUseCaseImpl>(HomeUseCaseImpl(
    homeRepositoryImpl: getIt<HomeRepositoryImpl>(),
  ));
  getIt.registerSingleton<GetCompanyInfoUseCaseImpl>(GetCompanyInfoUseCaseImpl(
    getCompanyInfoRepositoryImpl: getIt<GetCompanyInfoRepositoryImpl>(),
  ));
}
