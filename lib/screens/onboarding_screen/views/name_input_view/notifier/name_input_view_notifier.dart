import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'name_input_view_state.dart';

class NameInputViewNotifier extends StateNotifier<NameInputViewState> {
  NameInputViewNotifier()
      : super(const NameInputViewState(
            textFieldIsNotEmpty: false,
            termsOfServiceAreAccepted: false,
            nextButtonEnabled: false,
            userInputText: 'NA'));

  void toggleTermsOfService() {
    state = state.copyWith(
        termsOfServiceAreAccepted: !state.termsOfServiceAreAccepted);
    _updateNextButtonState();
  }

  void textFieldOnChanged(String inputText) {
    state = state.copyWith(
        textFieldIsNotEmpty: inputText.isNotEmpty, userInputText: inputText);
    _updateNextButtonState();
  }

  void _updateNextButtonState() {
    bool isEnabled =
        state.termsOfServiceAreAccepted && state.textFieldIsNotEmpty;
    state = state.copyWith(nextButtonEnabled: isEnabled);
  }
}
