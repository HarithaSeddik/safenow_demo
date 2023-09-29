import 'package:bloc/bloc.dart';

part 'email_onboarding_screen_state.dart';

class EmailOnboardingScreenCubit extends Cubit<EmailOnboardingScreenState> {
  EmailOnboardingScreenCubit()
      : super(const EmailOnboardingScreenState(
          textFieldIsNotEmpty: false,
          nextButtonEnabled: false,
        ));

  void textFieldOnChanged(String inputText) {
    emit(state.copyWith(
        textFieldIsNotEmpty: inputText.isNotEmpty, userEmailText: inputText));
    _updateNextButtonState();
  }

  void _updateNextButtonState() {
    bool isEnabled = state.textFieldIsNotEmpty;
    emit(state.copyWith(nextButtonEnabled: isEnabled));
  }
}
