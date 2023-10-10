import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/onboarding_screen/views/name_input_view/notifier/name_input_view_notifier.dart';
import '../screens/onboarding_screen/views/otp_view/notifier/otp_view_notifier.dart';
import '../screens/onboarding_screen/views/phone_input_view/notifier/phone_input_view_notifier.dart';

/// [StateNotifierProvider] should be used when working with more complex states like custom State
/// classes. This solution was extracted/migrated from the Cubit/State solution where Cubit class
/// was Replaced with a StateNotifier
final nameInputViewProvider =
    StateNotifierProvider<NameInputViewNotifier, NameInputViewState>((ref) {
  return NameInputViewNotifier();
});

final phoneInputViewProvider =
    StateNotifierProvider<PhoneInputViewNotifier, PhoneInputViewState>(
  (ref) => PhoneInputViewNotifier(),
);

final otpViewProvider = StateNotifierProvider<OtpViewNotifier, OtpViewState>(
    (ref) => OtpViewNotifierImpl(Initial()));
