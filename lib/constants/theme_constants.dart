import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

/// Create class for static UI constants, allowing for
/// better memory management of global data

class ThemeConstants {
  static TextStyle headlineMediumStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.lerp(FontWeight.w800, FontWeight.w900, 0.4),
    letterSpacing: 0.25,
    color: Colors.black,
  );
  static const TextStyle drawerSmallTextBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
    color: Colors.black,
  );
  static const TextStyle drawerSmallTextLight = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
    color: Colors.black,
  );
  static const TextStyle drawerMediumText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
    color: Colors.black,
  );
  static const TextStyle labelLargeStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    color: Colors.black,
  );
  static const TextStyle titleMediumStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.15,
  );
  static const TextStyle titleLargeStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.15,
  );
  static const TextStyle labelMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.15,
  );
  static const TextStyle labelSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.15,
  );
  static const TextStyle titleSmallStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );
  static const TextStyle bodyMediumStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
    color: Colors.white,
  );
  static const TextStyle bodySmallBoldStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
    color: Colors.white,
  );
  static const TextStyle bodySmallStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
    color: Colors.white,
    height: 1.4,
  );

  static const Color secondaryTextColor = Color(0xff1b6fc5);
  //Store a static customTextTheme to be used throughout the app
  static TextTheme customTextTheme = TextTheme(
          headlineMedium: headlineMediumStyle,
          labelLarge: labelLargeStyle,
          titleMedium: titleMediumStyle,
          titleSmall: titleSmallStyle,
          bodyMedium: bodyMediumStyle,
          bodySmall: bodySmallStyle,
          labelMedium: labelMedium)
      .apply(
    fontFamily: 'SFUIDisplay',
  );

  // Now for general color theme
  static const Color seedColor = Color(0xff0969d7);

  static ColorScheme customColorScheme =
      ColorScheme.fromSeed(seedColor: seedColor);

  static const Color primaryColor = Colors.white;
  static const Color secondaryColor = Color(0xff0969d7);

  static const Color primaryButtonColor = Color(0xff0969d7);

  static const Color secondaryButtonColor = Colors.white;
  // Other constants
  static const Map<String, String> otpThemeColors = {
    "otpThemeDisabledColor": "0xFFE7EAF0",
    "otpThemeInActiveColor": "0xFFE7EAF0",
    "otpThemeSelectedFillColor": "0xFFFFFFFF",
    "otpThemeSelectedColor": "0xFFE7EAF0",
    "otpThemeInActiveFillColor": "0XFFFAFBFD",
    "otpThemeActiveFillColor": "0xFFFFFFFF",
    "otpThemeActiveColor": "0xFFE7EAF0",
  };
  Color _color(String colorKey) => Color(
        int.parse(colorKey),
      );
  static PinTheme pinTheme = PinTheme(
    fieldHeight: 54,
    fieldWidth: 42,
    shape: PinCodeFieldShape.underline,
    disabledColor:
        Color(int.parse(otpThemeColors["otpThemeDisabledColor"] ?? '')),
    inactiveColor:
        Color(int.parse(otpThemeColors["otpThemeDisabledColor"] ?? '')),
    selectedFillColor:
        Color(int.parse(otpThemeColors["otpThemeDisabledColor"] ?? '')),
    selectedColor:
        Color(int.parse(otpThemeColors["otpThemeDisabledColor"] ?? '')),
    inactiveFillColor:
        Color(int.parse(otpThemeColors["otpThemeDisabledColor"] ?? '')),
    activeFillColor:
        Color(int.parse(otpThemeColors["otpThemeDisabledColor"] ?? '')),
    activeColor:
        Color(int.parse(otpThemeColors["otpThemeDisabledColor"] ?? '')),
    borderWidth: 1,
    borderRadius: BorderRadius.circular(20),
  );
}
