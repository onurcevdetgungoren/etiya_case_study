import 'package:etiya_case_study/data/datasource/dio_client.dart';
import 'package:etiya_case_study/data/datasource/filter_client.dart';
import 'package:etiya_case_study/data/datasource/games_client.dart';
import 'package:etiya_case_study/data/repositories/filter_repository.dart';
import 'package:etiya_case_study/data/repositories/game_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DioClient());
  locator.registerLazySingleton(() => GamesClient());
  locator.registerLazySingleton(() => GameRepository());
  locator.registerLazySingleton(() => FilterClient());
  locator.registerLazySingleton(() => FilterRepository());
}
