import 'package:chatterstick_streaming_app/data/models/library_model.dart';
import 'package:chatterstick_streaming_app/data/sources/remote/library_api_service.dart';

class LibraryRepository{
  final LibraryApiService remoteSource;
  LibraryRepository({required this.remoteSource});

  Future<List<LibraryModel>?> getLibrary() async {
    try {
      return await remoteSource.getLibrary();
    } catch (e) {}
    return null;
  }
}