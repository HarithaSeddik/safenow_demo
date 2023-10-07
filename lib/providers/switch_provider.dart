import 'package:flutter_riverpod/flutter_riverpod.dart';

final switchStateProvider = StateNotifierProvider<SwitchStateNotifier, bool>(
    (ref) => SwitchStateNotifier(false));

class SwitchStateNotifier extends StateNotifier<bool> {
  bool switchValue = false;

  SwitchStateNotifier(super.state);

  void toggleSwitchValue() {
    state = !state;
  }
}
