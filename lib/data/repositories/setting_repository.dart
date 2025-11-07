import 'package:chatterstick_streaming_app/data/models/profile_model.dart';
import 'package:chatterstick_streaming_app/data/sources/remote/setting_api_service.dart';
import 'package:image_picker/image_picker.dart';

class SettingRepository {
  final SettingApiService remoteSource;
  SettingRepository({required this.remoteSource});

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return remoteSource.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  Future<bool> createIdea({required String description}) {
    return remoteSource.createIdea(description: description);
  }

  Future<ProfileModel?> getProfile() async {
    try {
      return await remoteSource.getProfile();
    } catch (e) {}
    return null;
  }

  Future<bool> updateProfile({required String name, required XFile image}) {
    return remoteSource.updateProfile(name: name, image: image);
  }
}
