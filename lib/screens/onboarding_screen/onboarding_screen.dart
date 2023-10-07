import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safenow_demo/screens/onboarding_screen/views/name_input_view/cubit/name_input_view_cubit.dart';
import 'package:safenow_demo/screens/onboarding_screen/views/name_input_view/name_input_view.dart';
import 'package:safenow_demo/screens/onboarding_screen/views/otp_view/cubit/otp_view_cubit.dart';
import 'package:safenow_demo/screens/onboarding_screen/views/otp_view/otp_view.dart';
import 'package:safenow_demo/screens/onboarding_screen/views/phone_input_view/cubit/phone_input_view_cubit.dart';
import 'package:safenow_demo/screens/onboarding_screen/views/phone_input_view/phone_input_view.dart';
import '../home_screen/home_screen.dart';
import '../../widgets/custom_page_scaffold.dart';
import 'views/final_onboarding_view/final_onboarding_view.dart';
import 'views/welcome_view/welcome_view.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<NameInputViewCubit>(
            create: (context) => NameInputViewCubit()),
        BlocProvider<PhoneInputViewCubit>(
            create: (context) => PhoneInputViewCubit()),
        BlocProvider<OtpViewCubit>(
          create: (context) =>
              OtpViewCubitImpl(const Initial(), onSubmit: _goToNextPage),
        ),
      ],
      child: PageView(
          allowImplicitScrolling: false,
          physics:
              const NeverScrollableScrollPhysics(), // navigation only through buttons
          controller: _pageController,
          children: _onboardingContentList()),
    );
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
