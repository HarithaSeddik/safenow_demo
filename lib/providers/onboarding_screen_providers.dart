import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/onboarding_screen/views/name_input_view/cubit/name_input_view_cubit.dart';
import '../screens/onboarding_screen/views/otp_view/cubit/otp_view_cubit.dart';
import '../screens/onboarding_screen/views/phone_input_view/cubit/phone_input_view_cubit.dart';

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
