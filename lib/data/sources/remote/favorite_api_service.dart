import 'package:chatterstick_streaming_app/core/network/api_clients.dart';
import 'package:chatterstick_streaming_app/data/models/favourite_comics_model.dart';
import '../../../core/network/api_endpoints.dart';

class FavoriteApiService {
  final ApiClient apiClient;
  FavoriteApiService({required this.apiClient});

  Future<List<FavoriteComicModel>?> getFavorite() async {
    try {
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.favorite,
      );

      if (response['success'] == true) {
        List<FavoriteComicModel> list = [];
        for (var element in response['data']) {
          list.add(FavoriteComicModel.fromJson(element));
        }
        return list;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
