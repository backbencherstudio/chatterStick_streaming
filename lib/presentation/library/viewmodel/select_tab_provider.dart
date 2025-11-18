import 'dart:developer';

import 'package:flutter_riverpod/legacy.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);
final isDownloadProvider = StateNotifierProvider<DownloadNotifier, List<bool>>(
  (ref) => DownloadNotifier(),
);

class DownloadNotifier extends StateNotifier<List<bool>> {
  DownloadNotifier() : super([]);
  Future<void> getlength({
    required int length,
    bool isAllSelect = false,
  }) async {
    if (isAllSelect) {
      state = List.generate(length, (_) => true);
    } else {
      state = List.generate(length, (_) => false);
    }
  }

  bool isSelectOne() {
    if (state.length > 0) {
      return state.contains(true);
    } else {
      return false;
    }
  }

  bool isSelectAll() {
    if (state.length > 0) {
      if (state.contains(false)) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  void toggleIsSelect(int index) {
    final newState = [...state];
    newState[index] = !newState[index];
    state = newState;
  }
}
