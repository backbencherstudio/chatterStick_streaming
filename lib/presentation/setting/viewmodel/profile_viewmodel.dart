import 'package:chatterstick_streaming_app/core/network/api_clients.dart';
import 'package:chatterstick_streaming_app/data/repositories/setting_repository.dart';
import 'package:chatterstick_streaming_app/data/sources/remote/setting_api_service.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../data/models/profile_model.dart';

final profileViewModelProvider =
StateNotifierProvider<ProfileModelView, ProfileModel?>(
      (ref) => ProfileModelView(
    repository: SettingRepository(
      remoteSource: SettingApiService(apiClient: ApiClient()),
    ),
  ),
);

class ProfileModelView extends StateNotifier<ProfileModel?> {
  final SettingRepository repository;

  ProfileModelView({required this.repository}) : super(ProfileModel()) {
    getProfile();
  }

  Future<void> getProfile() async {
    final profile = await repository.getProfile();
    state = profile;
  }

  // Add this updateName method for safe, reactive updates
  void updateName(String name) {
    // assuming ProfileModel has a copyWith
    if (state != null) {
      state = state!.copyWith(name: name);
    }
  }
}
