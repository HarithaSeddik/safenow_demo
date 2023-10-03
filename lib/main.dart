import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'screens/onboarding_screen/onboarding_screen.dart';

void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: ThemeConstants.customTextTheme,
        colorScheme: ThemeConstants.customColorScheme,
        fontFamily: 'SFUIDisplay', //Use downloaded font family over the app
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(), // initial screen
    );
  }
}
