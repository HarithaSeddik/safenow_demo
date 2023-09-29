part of 'name_onboarding_screen_cubit.dart';

final class NameOnboardingScreenState {
  const NameOnboardingScreenState({
    required this.userInputText,
    required this.textFieldIsNotEmpty,
    required this.termsOfServiceAreAccepted,
    required this.nextButtonEnabled,
  });
  final bool textFieldIsNotEmpty, termsOfServiceAreAccepted, nextButtonEnabled;
  final String userInputText;

  NameOnboardingScreenState copyWith({
    bool? textFieldIsNotEmpty,
    bool? termsOfServiceAreAccepted,
    bool? nextButtonEnabled,
    String? userInputText,
  }) {
    return NameOnboardingScreenState(
      textFieldIsNotEmpty: textFieldIsNotEmpty ?? this.textFieldIsNotEmpty,
      termsOfServiceAreAccepted:
          termsOfServiceAreAccepted ?? this.termsOfServiceAreAccepted,
      nextButtonEnabled: nextButtonEnabled ?? this.nextButtonEnabled,
      userInputText: userInputText ?? this.userInputText,
    );
  }
}
