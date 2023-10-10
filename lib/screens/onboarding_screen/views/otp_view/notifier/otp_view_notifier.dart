import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'otp_view_state.dart';

// abstraction over cubit (now notifier class) helps with creating mock classes for testing
abstract class OtpViewNotifier implements StateNotifier<OtpViewState> {
  void onType(String otp);

  void resendCode();

  void timeOut();

  void onServerError(String err);

  void verified();

  void setOnSubmit(Function onSubmit);
}

class OtpViewNotifierImpl extends StateNotifier<OtpViewState>
    implements OtpViewNotifier {
  OtpViewNotifierImpl(super.initialState);

  late Function _onSubmit;

  @override
  void setOnSubmit(Function onSubmit) {
    _onSubmit = onSubmit;
  }

  void _submitOtp(String otp) async {
    await Future.delayed(const Duration(seconds: 2));
    _onSubmit.call();
  }

  void _resendOtp() {
    throw UnimplementedError('_resendOtp not implemented');
  }

  @override
  void onType(String otp) {
    if (otp.trim().length != 6) return;
    state = Loading();
    _submitOtp(otp);
  }

  @override
  void resendCode() {
    _resendOtp();
    state = Initial();
  }

  @override
  void timeOut() {
    state = TimedOut();
  }

  @override
  void onServerError(String err) {
    switch (err) {
      case 'errorCode1':
        state = TooManyRequests();
        break;
      case 'errorCode2':
        state = TooManyAttempts();
        break;
      case 'errorCode3':
        state = Incorrect('10');
        break;
    }
  }

  @override
  void verified() {
    state = Verified();
  }
}
