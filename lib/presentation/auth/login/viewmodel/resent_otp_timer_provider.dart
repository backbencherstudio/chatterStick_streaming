import 'dart:async';

import 'package:flutter_riverpod/legacy.dart';

final resendOtpTimerProvider =
    StateNotifierProvider<ResendOtpTimerNotifier, int>(
      (ref) => ResendOtpTimerNotifier(),
    );

class ResendOtpTimerNotifier extends StateNotifier<int> {
  static const int initialTime = 300;
  Timer? _timer;

  ResendOtpTimerNotifier() : super(initialTime);

  void start() {
    _timer?.cancel();
    state = initialTime;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state == 0) {
        _timer?.cancel();
      } else {
        state--;
      }
    });
  }

  void stop() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
