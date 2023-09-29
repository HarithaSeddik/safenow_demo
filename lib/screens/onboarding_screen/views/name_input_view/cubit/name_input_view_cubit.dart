import 'package:bloc/bloc.dart';
part 'name_input_view_state.dart';

class NameInputViewCubit extends Cubit<NameInputViewState> {
  NameInputViewCubit()
      : super(const NameInputViewState(
            textFieldIsNotEmpty: false,
            termsOfServiceAreAccepted: false,
            nextButtonEnabled: false,
            userInputText: 'NA'));

  void toggleTermsOfService() {
    emit(state.copyWith(
        termsOfServiceAreAccepted: !state.termsOfServiceAreAccepted));
    _updateNextButtonState();
  }

  void textFieldOnChanged(String inputText) {
    emit(state.copyWith(
        textFieldIsNotEmpty: inputText.isNotEmpty, userInputText: inputText));
    _updateNextButtonState();
  }

  void _updateNextButtonState() {
    bool isEnabled =
        state.termsOfServiceAreAccepted && state.textFieldIsNotEmpty;
    emit(state.copyWith(nextButtonEnabled: isEnabled));
  }
}
