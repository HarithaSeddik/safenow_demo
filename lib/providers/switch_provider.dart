import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final switchStateNotifier = ChangeNotifierProvider((ref) => SwitchState());

class SwitchState extends ChangeNotifier {
  bool switchValue = false;

  void toggleSwitchValue() {
    switchValue = !switchValue;
    notifyListeners();
  }
}
