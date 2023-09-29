import 'package:flutter/material.dart';
import 'package:safenow_demo/constants/image_constants.dart';
import 'package:safenow_demo/extensions/context_extensions.dart';
import 'package:safenow_demo/views/widgets/custom_button.dart';

class WelcomeOnboardingScreen extends StatelessWidget {
  const WelcomeOnboardingScreen({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Welcome to SafeNow",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: context.dynamicHeight(280),
          child: Image.asset(
            ImageConstants.welcomeOnBoardingScreenImage,
            fit: BoxFit.fill,
          ),
        ),
        const Spacer(),
        CustomButton(
          isPrimary: true,
          buttonText: "Let's go",
          onPressed: onPressed,
        )
      ],
    );
  }
}
