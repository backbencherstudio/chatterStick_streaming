import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/api_clients.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/sources/remote/auth_api_service.dart';

final forgotPasswordProvider = StateNotifierProvider<ForgotPasswordModelView,bool>(
      (ref) => ForgotPasswordModelView(
    repository: AuthRepository(
      remoteSource: AuthApiService(apiClient: ApiClient()),
    ),
  ),
);

class ForgotPasswordModelView extends StateNotifier<bool>{
  final AuthRepository repository;
  ForgotPasswordModelView({required this.repository}) : super(false);

  Future<bool> forgotPassword({required String email}) async {
    return await repository.forgotPassword(email: email);
  }

}