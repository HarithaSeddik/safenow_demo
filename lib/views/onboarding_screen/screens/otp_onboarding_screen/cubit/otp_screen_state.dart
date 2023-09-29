part of 'otp_screen_cubit.dart';

abstract class OtpScreenState extends Equatable {
  final bool enableResend;

  const OtpScreenState({this.enableResend = false});

  @override
  get props => [enableResend];
}

class Initial extends OtpScreenState {
  const Initial({super.enableResend});
}

class Incorrect extends OtpScreenState {
  final String remainingAttempts;
  final String remainingTime;
  final String remainingTimeUnit;

  const Incorrect(
    this.remainingAttempts,
    this.remainingTime,
    this.remainingTimeUnit,
    bool enableResend,
  ) : super(enableResend: enableResend);

  @override
  get props =>
      [...super.props, remainingAttempts, remainingTime, remainingTimeUnit];
}

class TooManyAttempts extends OtpScreenState {}

class TooManyRequests extends OtpScreenState {}

class TimedOut extends OtpScreenState {
  const TimedOut() : super(enableResend: true);
}

class Verified extends OtpScreenState {
  const Verified() : super(enableResend: true);
}

class Loading extends OtpScreenState {}
