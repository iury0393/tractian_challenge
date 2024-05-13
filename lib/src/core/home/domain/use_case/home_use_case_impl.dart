import 'package:tractian_challenge/src/core/home/data/repositories/home_repository_impl.dart';
import 'package:tractian_challenge/src/core/home/domain/model/home_model.dart';
import 'package:tractian_challenge/src/core/home/domain/use_case/home_use_case.dart';

class HomeUseCaseImpl implements HomeUseCase {
  final HomeRepositoryImpl homeRepositoryImpl;
  HomeUseCaseImpl({required this.homeRepositoryImpl});
  @override
  Future<List<HomeModel>> getCompanies() {
    return homeRepositoryImpl.getCompanies();
  }
}
