import 'package:chatterstick_streaming_app/data/sources/remote/setting_api_service.dart';

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


}
