import 'package:flutter/material.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import '../../../../widgets/custom_button.dart';

class FinalOnboardingView extends StatelessWidget {
  const FinalOnboardingView({super.key, required this.onPressed});
  final Function() onPressed;

  final String _titleText =
      "Great, your phone number has been successfully verified.";
  final String _buttonText = "Let's start";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 120),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.check,
            size: 70,
            color: ThemeConstants.secondaryColor,
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            _titleText,
            style: ThemeConstants.titleLargeStyle,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        CustomButton(
          isPrimary: false,
          buttonText: _buttonText,
          onPressed: onPressed,
        )
      ],
    );
  }
}
