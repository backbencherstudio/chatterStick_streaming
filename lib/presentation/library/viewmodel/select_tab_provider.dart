import 'package:flutter_riverpod/legacy.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);
final isDownloadProvider = StateNotifierProvider<DownloadNotifier, List<bool>>(
  (ref) => DownloadNotifier(),
);

class DownloadNotifier extends StateNotifier<List<bool>> {
  DownloadNotifier() : super([]);
  getlength(int length) {
    for (int i = 0; i < length; i++) {
      state.add(false);
    }
  }

  toggleIsSelect(int index) {
    state[index] = !state[index];
  }
}
