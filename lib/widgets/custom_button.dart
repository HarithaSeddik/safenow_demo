import 'package:flutter/material.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';

// Custom button widget, a HOC wrapper for the typical
// flutter button but with extra functionalities
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.isPrimary,
    required this.buttonText,
    required this.onPressed,
    this.isDisabled = false,
    this.margins = const EdgeInsets.symmetric(horizontal: 30),
  }) : super(key: key);
  final bool isPrimary;
  final String buttonText;
  final void Function() onPressed;
  final bool isDisabled;
  final EdgeInsets margins;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? 0.5 : 1,
      child: Container(
        margin: margins,
        height: 56,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => isDisabled ? null : onPressed.call(),
          style: ElevatedButton.styleFrom(
              backgroundColor: isPrimary
                  ? ThemeConstants.primaryButtonColor
                  : ThemeConstants.secondaryButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              buttonText,
              style: TextStyle(
                letterSpacing: 0.25,
                color: isPrimary
                    ? Colors.white
                    : ThemeConstants.secondaryTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
