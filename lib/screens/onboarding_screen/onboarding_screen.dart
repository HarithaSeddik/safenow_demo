import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_screen/home_screen.dart';
import '../widgets/custom_page_scaffold.dart';
import 'screens/email_onboarding_screen/cubit/email_onboarding_screen_cubit.dart';
import 'screens/email_onboarding_screen/enter_email_onboarding_screen.dart';
import 'screens/final_onboarding_screen.dart';
import 'screens/name_onboarding_screen/cubit/name_onboarding_screen_cubit.dart';
import 'screens/name_onboarding_screen/name_onboarding_screen.dart';
import 'screens/otp_onboarding_screen/cubit/otp_screen_cubit.dart';
import 'screens/otp_onboarding_screen/otp_onboarding_screen.dart';
import 'screens/welcome_onboarding_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController
        .dispose(); // Always dispose controllers, streams, etc.. to avoid memory leaks
    super.dispose();
  }

  void _goToNextPage() => _pageController.nextPage(
      duration: const Duration(milliseconds: 300), curve: Curves.ease);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: MultiBlocProvider(
          providers: [
            BlocProvider<NameOnboardingScreenCubit>(
                create: (context) => NameOnboardingScreenCubit()),
            BlocProvider<EmailOnboardingScreenCubit>(
                create: (context) => EmailOnboardingScreenCubit()),
            BlocProvider<OtpScreenCubit>(
              create: (context) =>
                  OtpScreenCubitImpl(const Initial(), onSubmit: _goToNextPage),
            ),
          ],
          child: PageView(
              allowImplicitScrolling: false,
              physics:
                  const NeverScrollableScrollPhysics(), // navigation only through buttons
              controller: _pageController,
              children: _onboardingContentList()),
        ))
      ],
    );
  }

  List<Widget> _onboardingContentList() => [
        PageScaffold(
          scaffoldChild: WelcomeOnboardingScreen(onPressed: _goToNextPage),
        ),
        PageScaffold(
          isPrimary: false,
          scaffoldChild: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: NameOnboardingScreen(
              onPressed: _goToNextPage,
            ),
          ),
        ),
        PageScaffold(
          scaffoldChild: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: EnterEmailOnboardingScreen(
              onPressed: _goToNextPage,
            ),
          ),
          isPrimary: false,
        ),
        const PageScaffold(
          isPrimary: false,
          scaffoldChild: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: OtpOnboardingScreen(),
          ),
        ),
        PageScaffold(
          isPrimary: false,
          scaffoldChild: FinalOnboardingScreen(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
          ),
        ),
      ];
}
