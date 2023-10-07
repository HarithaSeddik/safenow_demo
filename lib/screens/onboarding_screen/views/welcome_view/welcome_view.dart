import 'package:flutter/material.dart';
import 'package:safenow_demo/utils/constants/image_constants.dart';
import 'package:safenow_demo/utils/extensions/context_extensions.dart';
import '../../../../widgets/custom_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key, required this.onPressed});
  final Function() onPressed;
  final String _titleText = "Welcome to SafeNow";
  final String _buttonText = "Let's go";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            _titleText,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: context.dynamicHeight(400),
          child: Image.asset(
            ImageConstants.welcomeOnBoardingShadowScreenImage,
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(),
        CustomButton(
          isPrimary: true,
          buttonText: _buttonText,
          onPressed: onPressed,
        )
      ],
    );
  }
}
