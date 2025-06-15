import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CaptchaTimerNotifier extends StateNotifier<int> {
  Timer? _timer;

  CaptchaTimerNotifier() : super(0);

  void startTimer() {
    if (_timer != null) return;

    state = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--;
      } else {
        timer.cancel();
        _timer = null;
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    _timer = null;
    state = 0;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}