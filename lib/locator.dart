import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:spacera/core/data_sources/rockets/rockets_local_data_source.dart';
import 'package:spacera/core/data_sources/rockets/rockets_remote_data_source.dart';
import 'package:spacera/core/repositories/rocket_repository/rocket_repository.dart';
import 'package:spacera/core/repositories/rocket_repository/rocket_repository_impl.dart';
import 'package:spacera/core/services/http/http_service.dart';
import 'package:spacera/core/services/http/http_service_impl.dart';
import 'package:spacera/core/utils/file_helper.dart';
import 'core/services/connectivity/connectivity_service.dart';
import 'core/services/connectivity/connectivity_service_impl.dart';
import 'core/services/snackbar/snack_bar_service.dart';
import 'core/services/snackbar/snack_bar_service_impl.dart';

GetIt locator = GetIt.instance;

/// Setup function that is run before the App is run.
///   - Sets up singletons that can be called from anywhere
/// in the app by using locator<Service>() call.
///   - Also sets up factor methods for view models.
Future<void> setupLocator() async {
  // Services
  locator.registerLazySingleton<ConnectivityService>(
    () => ConnectivityServiceImpl(),
  );
  locator.registerLazySingleton<SnackBarService>(() => SnackBarServiceImpl());
  locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  // Data sources
  locator.registerLazySingleton<RocketsLocalDataSource>(
    () => RocketsLocalDataSourceImpl(),
  );
  locator.registerLazySingleton<RocketsRemoteDataSource>(
    () => RocketsRemoteDataSourceImpl(),
  );

  // Repositories
  locator.registerLazySingleton<RocketRepository>(() => RocketRepositoryImpl());

  // Utils
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());

  // External
  locator.registerLazySingleton<HiveInterface>(() => Hive);
}
