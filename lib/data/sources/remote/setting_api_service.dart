
import '../../../core/network/api_clients.dart';
import '../../../core/network/api_endpoints.dart';
import '../local/shared_preference/shared_preference.dart';


class SettingApiService {
  final ApiClient apiClient;
  SettingApiService({required this.apiClient});

  Future<bool> changePassword({required String oldPassword, required String newPassword}) async {
    try {
      final body = {
        'old_password': oldPassword,
        'new_password': newPassword,
      };
    //   final token = await SharedPreferenceData.getToken();
    //   print("token ======== $token");
    //
    // final  headers = {
    //     'Content-Type': 'application/json',
    //
    //  'Authorization': 'Bearer $token',
    //   };

      final response = await apiClient.postRequest(
        body: body,
       // headers: headers,
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
}
