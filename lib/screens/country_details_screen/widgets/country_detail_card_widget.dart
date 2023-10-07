import 'package:flutter/material.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';

class CountryDetailCardWidget extends StatelessWidget {
  const CountryDetailCardWidget({
    super.key,
    required this.titleText,
    required this.subTitleText,
    this.isVisible = true,
  });
  final String titleText;
  final String subTitleText;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    //Simple animations
    return AnimatedOpacity(
      opacity: isVisible ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isVisible ? 80 : 0,
        child: Card(
          color: ThemeConstants.primaryColor,
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            title: Text(
              titleText,
              style: const TextStyle(
                color: ThemeConstants.secondaryTextColor,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              subTitleText,
              style: const TextStyle(
                  color: ThemeConstants.secondaryTextColor, fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
