import 'package:chatterstick_streaming_app/core/network/api_clients.dart';
import 'package:chatterstick_streaming_app/data/models/library_model.dart';
import 'package:chatterstick_streaming_app/data/repositories/library_repository.dart';
import 'package:chatterstick_streaming_app/data/sources/remote/library_api_service.dart';
import 'package:chatterstick_streaming_app/presentation/library/viewmodel/select_tab_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final libraryItemProvider =
    StateNotifierProvider<LibraryModelView, List<LibraryModel?>>(
      (ref) => LibraryModelView(
        repository: LibraryRepository(
          remoteSource: LibraryApiService(apiClient: ApiClient()),
        ),
        ref: ref,
      ),
    );

class LibraryModelView extends StateNotifier<List<LibraryModel?>> {
  final LibraryRepository repository;
  final Ref ref;
  LibraryModelView({required this.repository, required this.ref}) : super([]) {
    getLibrary();
    if (state.isNotEmpty) {
      ref.read(isDownloadProvider.notifier).getLength( length:state.length);
    }
  }

  Future<void> getLibrary() async {
    final library = await repository.getLibrary();
    state = library!;
   await  ref.read(isDownloadProvider.notifier).getLength(length:state.length);
  }

 
}
