import 'package:get_it/get_it.dart';
import 'package:hotelsgo_task/core/api_services/api_services.dart';
import 'package:hotelsgo_task/features/home/data/data_source/home_remote_data_source.dart';

import '../../features/home/data/repos/home_repo_imp.dart';
import '../../features/home/domain/repos/home_repo.dart';
import '../../features/home/domain/use_cases/get_hotels_data_use_case.dart';

final serviceLocator = GetIt.instance;

class ServicesLocator {
  void init() {

    /// Api Services
    serviceLocator.registerLazySingleton<ApiServices>(
      () => ApiServices(),
    );

    /// Data Source
    serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImp(serviceLocator()),
    );

    /// Repos
    serviceLocator.registerLazySingleton<HomeRepo>(
      () => HomeRepoImp(serviceLocator()),
    );

    /// Use Cases
    serviceLocator.registerLazySingleton<GetHotelsDataUseCase>(
      () => GetHotelsDataUseCase(serviceLocator()),
    );
  }
}
