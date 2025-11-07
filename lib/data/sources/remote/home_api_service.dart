import 'package:chatterstick_streaming_app/core/network/api_endpoints.dart';

import '../../../core/network/api_clients.dart';
import '../../models/comics_banner_model.dart';
import '../../models/last_read_comics_model.dart';

class HomeApiService {
  final ApiClient apiClient;
  HomeApiService({required this.apiClient});
  Future<List<ComicsModel>?> getBannarComics() async {
    try {
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.bannerComics,
      );
      if (response['success'] == true) {
        List<ComicsModel> comicList = [];
        for (var item in response['data']) {
          comicList.add(ComicsModel.fromJson(item));
        }

        return comicList;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ComicsModel>?> getRecomandationComics() async {
    try {
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.recommendedComics,
      );
      if (response['success'] == true) {
        List<ComicsModel> comicList = [];
        for (var item in response['data']) {
          comicList.add(ComicsModel.fromJson(item));
        }

        return comicList;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LastReadComicsModel>?> getLastReadComics() async {
    try {
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.recommendedComics,
      );
      if (response['success'] == true) {
        List<LastReadComicsModel> comicList = [];
        for (var item in response['data']) {
          comicList.add(LastReadComicsModel.fromJson(item));
        }

        return comicList;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ComicsModel>?> getPopularComics() async {
    try {
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.popularComics,
      );
      if (response['success'] == true) {
        List<ComicsModel> comicList = [];
        for (var item in response['data']) {
          comicList.add(ComicsModel.fromJson(item));
        }

        return comicList;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
