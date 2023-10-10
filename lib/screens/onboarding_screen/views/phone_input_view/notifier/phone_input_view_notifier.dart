import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'phone_input_view_state.dart';

abstract class PhoneInputViewNotifier
    extends StateNotifier<PhoneInputViewState> {
  PhoneInputViewNotifier(super.state);

  void textFieldOnChanged(String inputText);
}

class PhoneInputViewNotifierImpl extends StateNotifier<PhoneInputViewState>
    implements PhoneInputViewNotifier {
  PhoneInputViewNotifierImpl()
      : super(
          const PhoneInputViewState(
            textFieldIsNotEmpty: false,
            nextButtonEnabled: false,
          ),
        );

  @override
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
