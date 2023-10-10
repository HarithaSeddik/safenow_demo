part of 'name_input_view_notifier.dart';

final class NameInputViewState {
  const NameInputViewState({
    required this.userInputText,
    required this.textFieldIsNotEmpty,
    required this.termsOfServiceAreAccepted,
    required this.nextButtonEnabled,
  });
  final bool textFieldIsNotEmpty, termsOfServiceAreAccepted, nextButtonEnabled;
  final String userInputText;

  NameInputViewState copyWith({
    bool? textFieldIsNotEmpty,
    bool? termsOfServiceAreAccepted,
    bool? nextButtonEnabled,
    String? userInputText,
  }) {
    return NameInputViewState(
      textFieldIsNotEmpty: textFieldIsNotEmpty ?? this.textFieldIsNotEmpty,
      termsOfServiceAreAccepted:
          termsOfServiceAreAccepted ?? this.termsOfServiceAreAccepted,
      nextButtonEnabled: nextButtonEnabled ?? this.nextButtonEnabled,
      userInputText: userInputText ?? this.userInputText,
    );
  }
}
