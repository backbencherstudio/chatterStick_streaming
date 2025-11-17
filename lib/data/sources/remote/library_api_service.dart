import 'package:chatterstick_streaming_app/core/network/api_clients.dart';

import '../../../core/network/api_endpoints.dart';
import '../../models/library_model.dart';

class LibraryApiService {
  final ApiClient apiClient;
  LibraryApiService({required this.apiClient});

  Future<List<LibraryModel>?>getLibrary() async {
    try {
      final response = await apiClient.getRequest(
        endpoints: ApiEndpoints.library,
      );

      if (response['success'] == true) {

        List<LibraryModel> list = [];
        for (var element in response['data']) {
         list.add( LibraryModel.fromJson(element));
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
