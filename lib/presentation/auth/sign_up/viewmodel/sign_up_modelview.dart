import 'package:chatterstick_streaming_app/core/network/api_clients.dart';
import 'package:chatterstick_streaming_app/data/repositories/auth_repository.dart';
import 'package:chatterstick_streaming_app/data/sources/remote/auth_api_service.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';

final signUpViewModelProvider = StateNotifierProvider<SignUpModelview, bool>(
  (ref) => SignUpModelview(
    repository: AuthRepository(
      remoteSource: AuthApiService(apiClient: ApiClient()),
    ),
  ),
);

class SignUpModelview extends StateNotifier<bool> {
  final AuthRepository repository;
  SignUpModelview({required this.repository}) : super(false);
  Future<bool> register({
    required String email,
    required String password,
    required String name,
    required XFile image,
    required String device,
  }) async {
    return await repository.register(
      email: email,
      password: password,
      name: name,
      image: image,
      device: device,
    );
  }
}
