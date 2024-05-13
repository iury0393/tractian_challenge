import 'package:tractian_challenge/src/core/home/data/data_source/home_data_souce.dart';
import 'package:tractian_challenge/src/core/home/domain/model/home_model.dart';
import 'package:tractian_challenge/src/core/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;
  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<List<HomeModel>> getCompanies() {
    return homeDataSource.getCompanies();
  }
}
