import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_screen_state.dart';

class OnboardingScreenCubit extends Cubit<OnboardingScreenState> {
  OnboardingScreenCubit() : super(OnboardingScreenInitial());
}
