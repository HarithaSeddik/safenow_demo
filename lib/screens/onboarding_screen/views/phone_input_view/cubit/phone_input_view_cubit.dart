import 'package:bloc/bloc.dart';

part 'phone_input_view_state.dart';

class PhoneInputViewCubit extends Cubit<PhoneInputViewState> {
  PhoneInputViewCubit()
      : super(const PhoneInputViewState(
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
