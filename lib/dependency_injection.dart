import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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

  //REPOSITORIES
  getIt.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl(
    homeDataSource: getIt<HomeDataSourceImpl>(),
  ));

  //USE CASE
  getIt.registerSingleton<HomeUseCaseImpl>(HomeUseCaseImpl(
    homeRepositoryImpl: getIt<HomeRepositoryImpl>(),
  ));
}
