import 'package:chatterstick_streaming_app/data/models/favourite_comics_model.dart';
import 'package:chatterstick_streaming_app/data/sources/remote/favorite_api_service.dart';

class FavoriteRepository{
  final FavoriteApiService remoteSource;
  FavoriteRepository({required this.remoteSource});

  Future<List<FavoriteComicModel>?> getFavorite() async {
    try {
      return await remoteSource.getFavorite();
    } catch (e) {}
    return null;
  }
}