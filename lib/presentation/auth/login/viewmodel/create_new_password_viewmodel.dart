import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/api_clients.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/sources/remote/auth_api_service.dart';

final createNewPasswordProvider =
    StateNotifierProvider<CreateNewPasswordViewModel, bool>(
      (ref) => CreateNewPasswordViewModel(
        repository: AuthRepository(
          remoteSource: AuthApiService(apiClient: ApiClient()),
        ),
      ),
    );

class CreateNewPasswordViewModel extends StateNotifier<bool> {
  final AuthRepository repository;
  CreateNewPasswordViewModel({required this.repository}) : super(false);

  Future<bool> newPassword({
    required String email,
    required String password,
    required String token,
  }) async {
    return await repository.newPassword(
      email: email,
      password: password,
      otp: token,
    );
  }
}
