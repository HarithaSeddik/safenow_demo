part of 'otp_view_cubit.dart';

abstract class OtpViewState {
  const OtpViewState();
}

class Initial extends OtpViewState {}

class Incorrect extends OtpViewState {
  final String remainingTime;

  const Incorrect(
    this.remainingTime,
  );
}

class TooManyAttempts extends OtpViewState {}

class TooManyRequests extends OtpViewState {}

class TimedOut extends OtpViewState {}

class Verified extends OtpViewState {}

class Loading extends OtpViewState {}
