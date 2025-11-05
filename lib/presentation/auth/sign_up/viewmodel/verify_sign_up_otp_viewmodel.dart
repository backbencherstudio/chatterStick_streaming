import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/api_clients.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/sources/remote/auth_api_service.dart';

final verifySignUpOtpProvider = StateNotifierProvider<SignUpOtpVerify, bool>(
  (ref) => SignUpOtpVerify(
    repository: AuthRepository(
      remoteSource: AuthApiService(apiClient: ApiClient()),
    ),
  ),
);

class SignUpOtpVerify extends StateNotifier<bool> {
  final AuthRepository repository;
  SignUpOtpVerify({required this.repository}) : super(false);

  Future<bool> emailVerify({required String otp, required String email}) async {
    return await repository.emailVerify(email: email, otp: otp);
  }
}
