import 'package:chatterstick_streaming_app/core/network/api_clients.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../data/models/profile_model.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../data/sources/remote/auth_api_service.dart';
final profileViewModelProvider =
    StateNotifierProvider<ProfileModelView, ProfileModel?>(
      (ref) => ProfileModelView(
        repository: AuthRepository(
          remoteSource: AuthApiService(apiClient: ApiClient()),
        ),
      ),
    );

class ProfileModelView extends StateNotifier<ProfileModel?> {
  final AuthRepository repository;

  ProfileModelView({required this.repository}) : super(ProfileModel()) {getProfile();}
  Future<void> getProfile() async {
   final profile=await  repository.getProfile(
    );
   state=profile;

}}
