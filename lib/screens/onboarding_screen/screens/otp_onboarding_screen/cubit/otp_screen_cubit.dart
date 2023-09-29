import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_screen_state.dart';

// abstraction over cubits helps with creating mock classes for testing
abstract class OtpScreenCubit implements Cubit<OtpScreenState> {
  void onType(String otp);

  void resendCode();

  void timeOut();

  void enableResend();

  void onServerError(String err, Map<String, dynamic> details);

  void verified();
}

class OtpScreenCubitImpl extends Cubit<OtpScreenState>
    implements OtpScreenCubit {
  OtpScreenCubitImpl(super.initialState, {required this.onSubmit});
  final Function onSubmit;
  //TODO: implement submit otp
  void _submitOtp(String otp) async {
    await Future.delayed(const Duration(seconds: 2));
    onSubmit.call();
  }

  //TODO: implement resend otp
  void _resendOtp() {}
  @override
  void onType(String otp) {
    if (otp.trim().length != 6) return;
    emit(Loading());
    _submitOtp(otp);
  }

  @override
  void resendCode() {
    _resendOtp();
    emit(const Initial());
  }

  @override
  void timeOut() {
    emit(const TimedOut());
  }

  @override
  void enableResend() {
    emit(const Initial(enableResend: true));
  }

  @override
  void onServerError(String err, Map<String, dynamic> details) {
    switch (err) {
      case 'VE10001':
        emit(TooManyRequests());
        break;
      case 'VE10002':
        emit(TooManyAttempts());
        break;
      case 'VE10004':
        final isResendEnabled = state.enableResend;
        emit(Incorrect(
          details['remaining'].toString(),
          details['LockedHours'].toString(),
          'hour',
          isResendEnabled,
        ));
        break;
    }
  }

  @override
  void verified() {
    emit(const Verified());
  }
}
