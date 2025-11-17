import 'package:chatterstick_streaming_app/core/network/api_clients.dart';
import 'package:chatterstick_streaming_app/data/models/library_model.dart';
import 'package:chatterstick_streaming_app/data/repositories/library_repository.dart';
import 'package:chatterstick_streaming_app/data/sources/remote/library_api_service.dart';
import 'package:flutter_riverpod/legacy.dart';

final libraryItemViewModel =
    StateNotifierProvider<LibraryModelView, List<LibraryModel?>>(
      (ref) => LibraryModelView(
        repository: LibraryRepository(
          remoteSource: LibraryApiService(apiClient: ApiClient()),
        ),
      ),
    );

class LibraryModelView extends StateNotifier<List<LibraryModel?>> {
  final LibraryRepository repository;
  LibraryModelView({required this.repository}) : super([]) {
    getLibrary();
  }

  Future<void> getLibrary() async {
    final library = await repository.getLibrary();
    state = library!;
  }
}
