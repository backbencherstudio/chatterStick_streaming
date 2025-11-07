import '../models/comics_banner_model.dart';
import '../models/last_read_comics_model.dart';
import '../sources/remote/home_api_service.dart' show HomeApiService;

class HomeRepository {
  HomeApiService remoteSource;
  HomeRepository({required this.remoteSource});
 Future<List<ComicsBannerModel>?> getBannarComics() {
    return remoteSource.getBannarComics();
  }

  Future<List<ComicsBannerModel>?> getRecomandationComics() {
    return remoteSource.getRecomandationComics();
  }

  Future<List<LastReadComicsModel>?> getLastReadComics() {
    return remoteSource.getLastReadComics();
  }

  Future<List<ComicsBannerModel>?> getPopularComics() {
   return  remoteSource.getPopularComics();
  }
}
