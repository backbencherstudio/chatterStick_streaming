import '../models/comics_banner_model.dart';
import '../models/last_read_comics_model.dart';
import '../sources/remote/home_api_service.dart' show HomeApiService;

class HomeRepository {
  HomeApiService remoteSource;
  HomeRepository({required this.remoteSource});
  Future<List<ComicsModel>?> getBannarComics() {
    return remoteSource.getBannarComics();
  }

  Future<List<ComicsModel>?> getRecomandationComics() {
    return remoteSource.getRecomandationComics();
  }

  Future<List<LastReadComicsModel>?> getLastReadComics() {
    return remoteSource.getLastReadComics();
  }

  Future<List<ComicsModel>?> getPopularComics() {
    return remoteSource.getPopularComics();
  }
}
