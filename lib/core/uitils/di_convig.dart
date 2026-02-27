import 'package:get_it/get_it.dart';
import 'package:news_app/core/apiservice.dart';
import 'package:news_app/feature/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerSingleton(Apiservice());
  getIt.registerLazySingleton(
    () => HomeRepoImpl(apiservice: getIt.get<Apiservice>()),
  );
}
