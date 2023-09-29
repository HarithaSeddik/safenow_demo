part of 'email_onboarding_screen_cubit.dart';

final class EmailOnboardingScreenState {
  const EmailOnboardingScreenState({
    this.userEmailText,
    required this.textFieldIsNotEmpty,
    required this.nextButtonEnabled,
  });
  final bool textFieldIsNotEmpty, nextButtonEnabled;
  final String? userEmailText;
  EmailOnboardingScreenState copyWith({
    bool? textFieldIsNotEmpty,
    bool? nextButtonEnabled,
    String? userEmailText,
  }) {
    return EmailOnboardingScreenState(
      userEmailText: userEmailText ?? this.userEmailText,
      textFieldIsNotEmpty: textFieldIsNotEmpty ?? this.textFieldIsNotEmpty,
      nextButtonEnabled: nextButtonEnabled ?? this.nextButtonEnabled,
    );
  }
}
