import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'name_input_view_state.dart';

abstract class NameInputViewNotifier
    implements StateNotifier<NameInputViewState> {
  void toggleTermsOfService();

  void textFieldOnChanged(String inputText);
}

class NameInputViewNotifierImpl extends StateNotifier<NameInputViewState>
    implements NameInputViewNotifier {
  NameInputViewNotifierImpl()
      : super(
          const NameInputViewState(
              textFieldIsNotEmpty: false,
              termsOfServiceAreAccepted: false,
              nextButtonEnabled: false,
              userInputText: 'NA'),
        );
  @override
  void toggleTermsOfService() {
    state = state.copyWith(
        termsOfServiceAreAccepted: !state.termsOfServiceAreAccepted);
    _updateNextButtonState();
  }

  @override
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
