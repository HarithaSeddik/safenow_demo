import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get sampleScreenHeight => 812; //pixels
  double get sampleScreenWidth => 375; //pixels

  //returns height as a custom multiplier ratio of available screen height
  double multiplierHeight(double multiplier) {
    return mediaQuery.size.height * multiplier;
  }

  //returns height as a multiplier ratio of available height based on current sample screen
  double dynamicHeight(double inputHeight) {
    return mediaQuery.size.height * (inputHeight / sampleScreenHeight);
  }

  //returns width as a multiplier ratio of available screen width
  double multiplierWidth(double multiplier) {
    return mediaQuery.size.width * multiplier;
  }

  //returns width as a multiplier ratio of available width based on sample screen
  double dynamicWidth(double inputWidth) {
    return mediaQuery.size.width * (inputWidth / sampleScreenWidth);
  }
}
