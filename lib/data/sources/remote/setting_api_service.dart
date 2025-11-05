import '../../../core/network/api_clients.dart';
import '../../../core/network/api_endpoints.dart';
import '../local/shared_preference/shared_preference.dart';

class SettingApiService {
  final ApiClient apiClient;
  SettingApiService({required this.apiClient});

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final body = {'old_password': oldPassword, 'new_password': newPassword};
      final response = await apiClient.postRequest(
        body: body,
        endpoints: ApiEndpoints.changePassword,
      );
      if (response['success']) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> createIdea({required String description}) async {
    try {
      final body = {'description': description};
      final response = await apiClient.postRequest(
        body: body,
        endpoints: ApiEndpoints.createIdea,
      );
      if (response['success']) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }
}
