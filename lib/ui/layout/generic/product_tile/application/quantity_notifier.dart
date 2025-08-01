import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantityNotifier extends StateNotifier<int> {
  QuantityNotifier() : super(1);

  void increment() {
    if (state < 10) state++;
  }

  void decrement() {
    if (state > 1) state--;
  }

  void reset() {
    state = 1;
  }
}
