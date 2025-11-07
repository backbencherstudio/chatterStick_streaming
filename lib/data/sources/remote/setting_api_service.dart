import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/network/api_clients.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/resource/constansts/color_manger.dart';
import '../../../core/utils/utils.dart';
import '../../models/profile_model.dart';

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

  Future<bool> updateProfile({
    required String name,
    required XFile image,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "image": await MultipartFile.fromFile(image.path),
      });
      final response = await apiClient.patchRequest(
        formData: formData,
        endpoints: ApiEndpoints.updateProfile,
      );
      if (response['success'] == true) {
        log(response['message']);
        Utils.showToast(
          message: response['message'],
          backgroundColor: ColorManager.successColor,
          textColor: ColorManager.whiteColor,
        );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
