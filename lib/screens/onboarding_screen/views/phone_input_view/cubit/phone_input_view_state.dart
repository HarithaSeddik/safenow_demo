part of 'phone_input_view_cubit.dart';

final class PhoneInputViewState {
  const PhoneInputViewState({
    this.userEmailText,
    required this.textFieldIsNotEmpty,
    required this.nextButtonEnabled,
  });
  final bool textFieldIsNotEmpty, nextButtonEnabled;
  final String? userEmailText;
  PhoneInputViewState copyWith({
    bool? textFieldIsNotEmpty,
    bool? nextButtonEnabled,
    String? userEmailText,
  }) {
    return PhoneInputViewState(
      userEmailText: userEmailText ?? this.userEmailText,
      textFieldIsNotEmpty: textFieldIsNotEmpty ?? this.textFieldIsNotEmpty,
      nextButtonEnabled: nextButtonEnabled ?? this.nextButtonEnabled,
    );
  }
}
