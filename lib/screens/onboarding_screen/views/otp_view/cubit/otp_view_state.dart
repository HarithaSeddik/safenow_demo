part of 'otp_view_cubit.dart';

abstract class OtpViewState extends Equatable {
  final bool enableResend;

  const OtpViewState({this.enableResend = false});

  @override
  get props => [enableResend];
}

class Initial extends OtpViewState {
  const Initial({super.enableResend});
}

class Incorrect extends OtpViewState {
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

class TooManyAttempts extends OtpViewState {}

class TooManyRequests extends OtpViewState {}

class TimedOut extends OtpViewState {
  const TimedOut() : super(enableResend: true);
}

class Verified extends OtpViewState {
  const Verified() : super(enableResend: true);
}

class Loading extends OtpViewState {}
