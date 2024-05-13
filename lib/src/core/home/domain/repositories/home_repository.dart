import 'package:tractian_challenge/src/core/home/domain/model/home_model.dart';

abstract class HomeRepository {
  Future<List<HomeModel>> getCompanies();
}
