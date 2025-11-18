import 'package:flutter_riverpod/legacy.dart';
import '../../../data/models/library_model.dart';

final downloadedLibraryProvider = StateNotifierProvider<DownloadedLibraryNotifier, List<LibraryModel>>(
      (ref) => DownloadedLibraryNotifier(),
);

class DownloadedLibraryNotifier extends StateNotifier<List<LibraryModel>> {
  DownloadedLibraryNotifier() : super([]);

  void addItem(LibraryModel item) {
    List<LibraryModel> items = state;

    if (!items.contains(item.id)) {
      items.add(item);
      state = items;
    }
  }

  void removeItems(List<LibraryModel> items) {
    state = state.where((e) => !items.contains(e)).toList();
  }

}
