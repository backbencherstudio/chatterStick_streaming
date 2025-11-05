import 'package:chatterstick_streaming_app/data/repositories/setting_repository.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../core/network/api_clients.dart';
import '../../../data/sources/remote/setting_api_service.dart';

final changePasswordProvider =
    StateNotifierProvider<ChangeOldPasswordViewmodel, bool>(
      (ref) => ChangeOldPasswordViewmodel(
        repository: SettingRepository(
          remoteSource: SettingApiService(apiClient: ApiClient()),
        ),
      ),
    );

class ChangeOldPasswordViewmodel extends StateNotifier<bool> {
  final SettingRepository repository;

  ChangeOldPasswordViewmodel({required this.repository}) : super(false);

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return await repository.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
