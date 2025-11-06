import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/network/api_clients.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/profile_model.dart';
import '../local/shared_preference/shared_preference.dart';

class AuthApiService {
  final ApiClient apiClient;
  AuthApiService({required this.apiClient});
  Future<bool> register({
    required String email,
    required String password,
    required String name,
    required XFile image,
    required String device,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "email": email,
        "password": password,
        "device": device,
        "image": await MultipartFile.fromFile(image.path),
      });
      final response = await apiClient.postRequest(
        formData: formData,
        endpoints: ApiEndpoints.register,
      );
      if (response['success'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> emailVerify({required String email, required String otp}) async {
    try {
      final body = {"email": email, "token": otp};
      final response = await apiClient.postRequest(
        body: body,
        endpoints: ApiEndpoints.verifyMail,
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

  Future<bool> forgotPassword({required String email}) async {
    try {
      final body = {'email': email};
      final response = await apiClient.postRequest(
        body: body,
        endpoints: ApiEndpoints.forgotPassword,
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

  Future<bool> login({required String email, required String password}) async {
    try {
      final body = {"email": email, "password": password};
      final response = await apiClient.postRequest(
        body: body,
        endpoints: ApiEndpoints.login,
      );
      if (response['success'] == true) {
        await SharedPreferenceData.setToken(
          response['authorization']['access_token'],
        );
        final token = await SharedPreferenceData.getToken();
        log("$token");
        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ProfileModel?> getProfile() async {
    try {

      final response = await apiClient.getRequest(endpoints: ApiEndpoints.me);
      if (response['success'] == true) {
        return ProfileModel.fromJson(response['data']);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
