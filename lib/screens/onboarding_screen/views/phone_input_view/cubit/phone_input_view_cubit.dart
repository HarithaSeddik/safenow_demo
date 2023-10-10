import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'phone_input_view_state.dart';

class PhoneInputViewNotifier extends StateNotifier<PhoneInputViewState> {
  PhoneInputViewNotifier()
      : super(const PhoneInputViewState(
          textFieldIsNotEmpty: false,
          nextButtonEnabled: false,
        ));

  void textFieldOnChanged(String inputText) {
    state = state.copyWith(
        textFieldIsNotEmpty: inputText.isNotEmpty, userPhoneNumber: inputText);
    _updateNextButtonState();
  }

  void _updateNextButtonState() {
    bool isEnabled = state.textFieldIsNotEmpty;
    state = state.copyWith(nextButtonEnabled: isEnabled);
  }
}
