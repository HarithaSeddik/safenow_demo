import 'package:bloc/bloc.dart';
part 'name_onboarding_screen_state.dart';

class NameOnboardingScreenCubit extends Cubit<NameOnboardingScreenState> {
  NameOnboardingScreenCubit()
      : super(const NameOnboardingScreenState(
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
