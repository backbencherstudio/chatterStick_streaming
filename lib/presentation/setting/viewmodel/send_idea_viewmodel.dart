import 'package:chatterstick_streaming_app/data/repositories/setting_repository.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../core/network/api_clients.dart';
import '../../../data/sources/remote/setting_api_service.dart';

final sentIdeaProvider = StateNotifierProvider<SendIdeaViewmodel, bool>(
  (ref) => SendIdeaViewmodel(
    repository: SettingRepository(
      remoteSource: SettingApiService(apiClient: ApiClient()),
    ),
  ),
);

class SendIdeaViewmodel extends StateNotifier<bool> {
  final SettingRepository repository;

  SendIdeaViewmodel({required this.repository}) : super(false);

  Future<bool> createIdea({required String description}) async {
    return await repository.createIdea(description: description);
  }
}
