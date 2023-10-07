import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenow_demo/data/graphql/graphql_helper.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'screens/onboarding_screen/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GraphQLHelper.init();

    return MaterialApp(
      // use custom text, color themes
      theme: ThemeData(
        textTheme: ThemeConstants.customTextTheme,
        colorScheme: ThemeConstants.customColorScheme,
        fontFamily: 'SFUIDisplay', //Use downloaded font family over the app
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(), // initial screen const HomeScreen()
    );
  }
}
