import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safenow_demo/constants/theme_constants.dart';
import 'package:safenow_demo/views/home_screen/cubit/home_screen_cubit.dart';
import 'package:safenow_demo/views/onboarding_screen/onboarding_screen.dart';
import 'views/onboarding_screen/cubit/onboarding_screen_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeScreenCubit>(
          create: (context) => HomeScreenCubit(),
        ),
        BlocProvider<OnboardingScreenCubit>(
          create: (context) => OnboardingScreenCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: ThemeConstants.customTextTheme,
          colorScheme: ThemeConstants.customColorScheme,
          fontFamily: 'Linik/Sans',
          useMaterial3: true,
        ),
        home: const OnBoardingScreen(),
      ),
    );
  }
}
