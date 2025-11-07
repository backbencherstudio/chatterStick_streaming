import 'package:chatterstick_streaming_app/core/network/api_clients.dart';
import 'package:chatterstick_streaming_app/data/sources/remote/home_api_service.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../data/models/home_screen_model.dart';
import '../../../data/repositories/home_repository.dart';

final homeProvider =
    StateNotifierProvider<HomeScreenViewmodel, HomeScreenModel>(
  (ref) => HomeScreenViewmodel(
    homeRepository: HomeRepository(
      remoteSource: HomeApiService(apiClient: ApiClient()),
    ),
  ),
);

class HomeScreenViewmodel extends StateNotifier<HomeScreenModel> {
  final HomeRepository homeRepository;

  HomeScreenViewmodel({required this.homeRepository})
      : super(
          HomeScreenModel(
            bannerData: const [],
            lastReadData: const [],
            recomandationData: const [],
            popularData: const [],
            isLoading: true,
          ),
        ) {
    getAllHomeData();
  }

  Future<void> getAllHomeData() async {
    try {
      state = state.copyWith(isLoading: true);

      final banner = await homeRepository.getBannarComics();
      final recomandation = await homeRepository.getRecomandationComics();
      final lastRead = await homeRepository.getLastReadComics();
      final popular = await homeRepository.getPopularComics();

      state = state.copyWith(
        bannerData: banner,
        recomandationData: recomandation,
        lastReadData: lastRead,
        popularData: popular,
        isLoading: false,
      );
    } catch (e) {
      // Optionally handle error state
      state = state.copyWith(isLoading: false);
    }
  }
}




