import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../core/network/api_clients.dart';
import '../../../data/models/favourite_comics_model.dart';
import '../../../data/repositories/favorite_repository.dart';
import '../../../data/sources/remote/favorite_api_service.dart';

final favoriteComicProvider =
    StateNotifierProvider<FavoriteViewModel, List<FavoriteComicModel?>>(
      (ref) => FavoriteViewModel(
        repository: FavoriteRepository(
          remoteSource: FavoriteApiService(apiClient: ApiClient()),
        ),
      ),
    );

class FavoriteViewModel extends StateNotifier<List<FavoriteComicModel?>> {
  final FavoriteRepository repository;
  FavoriteViewModel({required this.repository}) : super([])
  {
    getFavorite();

  }

  getFavorite()async{
  final favorite = await  repository.getFavorite();
state = favorite!;

}}
