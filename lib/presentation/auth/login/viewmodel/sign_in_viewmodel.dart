
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/api_clients.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/sources/remote/auth_api_service.dart';

final signInViewModelProvider = StateNotifierProvider<SignInModelview, bool>(
  (ref) => SignInModelview(
    repository: AuthRepository(
      remoteSource: AuthApiService(apiClient: ApiClient()),
    ),
  ),
);

class SignInModelview extends StateNotifier<bool> {
  final AuthRepository repository;
  SignInModelview({required this.repository}) : super(false);
  Future<bool> signIn({required String email ,required String password})async {
   return await repository.login(email: email, password: password);
  }
}