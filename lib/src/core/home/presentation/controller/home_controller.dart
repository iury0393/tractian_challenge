import 'package:mobx/mobx.dart';
import 'package:tractian_challenge/dependency_injection.dart';
import 'package:tractian_challenge/src/core/home/domain/model/home_model.dart';
import 'package:tractian_challenge/src/core/home/domain/use_case/home_use_case.dart';
import 'package:tractian_challenge/src/core/home/domain/use_case/home_use_case_impl.dart';
import 'package:tractian_challenge/src/shared/utils/utils.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeUseCase _homeUseCase = getIt<HomeUseCaseImpl>();

  @observable
  bool loading = false;

  @observable
  bool error = false;

  @observable
  List<HomeModel> _list = [];
  @computed
  HomeModel get jaguarData => _list[0];
  @computed
  HomeModel get tobiasData => _list[1];
  @computed
  HomeModel get apexData => _list[2];

  @action
  Future<void> getCompanies() async {
    try {
      loading = true;
      final List<HomeModel> data = await _homeUseCase.getCompanies();
      _list = data;
      loading = false;
    } catch (e) {
      kLogger.e(e);
      error = true;
    }
  }
}
