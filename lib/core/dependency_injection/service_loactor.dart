import 'package:get_it/get_it.dart';
import 'package:instagram_reels/core/repositories/reels_repository.dart';
import 'package:instagram_reels/core/services/dio_http_service.dart';
import 'package:instagram_reels/core/services/http_service.dart';

GetIt getIt = GetIt.instance;

void serviceLoactor() {
  getIt.registerLazySingleton<HttpService>(() => DioHttpService());

  getIt.registerLazySingleton<ReelsRepository>(
      () => ReelsRepository(httpService: GetIt.I<HttpService>()));
}
