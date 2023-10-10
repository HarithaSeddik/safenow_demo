import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenow_demo/providers/onboarding_screen_providers.dart';
import 'package:safenow_demo/screens/onboarding_screen/views/name_input_view/name_input_view.dart';
import 'package:safenow_demo/screens/onboarding_screen/views/otp_view/otp_view.dart';
import 'package:safenow_demo/screens/onboarding_screen/views/phone_input_view/phone_input_view.dart';
import '../home_screen/home_screen.dart';
import '../../widgets/custom_page_scaffold.dart';
import 'views/final_onboarding_view/final_onboarding_view.dart';
import 'views/welcome_view/welcome_view.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _OnBoardingScreenState();
  }
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    ref.read(otpViewProvider.notifier).setOnSubmit(_goToNextPage);
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
    return PageView(
        allowImplicitScrolling: false,
        physics:
            const NeverScrollableScrollPhysics(), // navigation only through buttons
        controller: _pageController,
        children: _onboardingContentList());
  }

  //Widget list 'views' to be rendered by PageView
  List<Widget> _onboardingContentList() => [
        PageScaffold(
          scaffoldChild: WelcomeView(onPressed: _goToNextPage),
        ),
        PageScaffold(
          isPrimary: false,
          scaffoldChild: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: NameInputView(
              onPressed: _goToNextPage,
            ),
          ),
        ),
        PageScaffold(
          scaffoldChild: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: PhoneInputView(
              onPressed: _goToNextPage,
            ),
          ),
          isPrimary: false,
        ),
        const PageScaffold(
          isPrimary: false,
          scaffoldChild: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: OtpView(),
          ),
        ),
        PageScaffold(
          isPrimary: false,
          scaffoldChild: FinalOnboardingView(
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false),
          ),
        ),
      ];
}
