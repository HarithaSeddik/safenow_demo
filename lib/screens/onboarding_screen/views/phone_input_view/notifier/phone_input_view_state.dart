part of 'phone_input_view_notifier.dart';

final class PhoneInputViewState {
  const PhoneInputViewState({
    this.userPhoneNumber,
    required this.textFieldIsNotEmpty,
    required this.nextButtonEnabled,
  });
  final bool textFieldIsNotEmpty, nextButtonEnabled;
  final String? userPhoneNumber;
  PhoneInputViewState copyWith({
    bool? textFieldIsNotEmpty,
    bool? nextButtonEnabled,
    String? userPhoneNumber,
  }) {
    return PhoneInputViewState(
      userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
      textFieldIsNotEmpty: textFieldIsNotEmpty ?? this.textFieldIsNotEmpty,
      nextButtonEnabled: nextButtonEnabled ?? this.nextButtonEnabled,
    );
  }
}
