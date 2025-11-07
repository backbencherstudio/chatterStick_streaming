import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/network/api_clients.dart';

import '../../../data/repositories/setting_repository.dart';
import '../../../data/sources/remote/setting_api_service.dart';

final profileUpdateViewModelProvider =
    StateNotifierProvider<ProfileUpdateModelView, bool>(
      (ref) => ProfileUpdateModelView(
        repository: SettingRepository(
          remoteSource: SettingApiService(apiClient: ApiClient()),
        ),
      ),
    );

class ProfileUpdateModelView extends StateNotifier<bool> {
  final SettingRepository repository;

  ProfileUpdateModelView({required this.repository}) : super(false);
  Future<bool> updateProfile({
    required String name,
    required XFile image,
  }) async {
    return repository.updateProfile(image: image, name: name);
  }
}
