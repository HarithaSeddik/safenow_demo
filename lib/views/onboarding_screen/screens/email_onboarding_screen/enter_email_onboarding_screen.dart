import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safenow_demo/constants/theme_constants.dart';

import 'package:safenow_demo/extensions/context_extensions.dart';
import 'package:safenow_demo/views/onboarding_screen/screens/email_onboarding_screen/cubit/email_onboarding_screen_cubit.dart';
import 'package:safenow_demo/views/onboarding_screen/screens/name_onboarding_screen/cubit/name_onboarding_screen_cubit.dart';

import 'package:safenow_demo/views/onboarding_screen/widgets/custom_text_field.dart';

class EnterEmailOnboardingScreen extends StatefulWidget {
  const EnterEmailOnboardingScreen({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

  @override
  State<EnterEmailOnboardingScreen> createState() =>
      _EnterEmailOnboardingScreenState();
}

class _EnterEmailOnboardingScreenState
    extends State<EnterEmailOnboardingScreen> {
  final String _titleText = "Nice to meet you, ";
  final String _bodyText =
      "To make sure that you are a real person, please enter your phone number here: ";
  final String _detailText = "Why do you need my phone number? ";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 100),
          width: context.dynamicWidth(200),
          child:
              BlocBuilder<NameOnboardingScreenCubit, NameOnboardingScreenState>(
            bloc: BlocProvider.of<NameOnboardingScreenCubit>(context),
            builder: (context, state) {
              return RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: _titleText,
                    ),
                    TextSpan(
                      text: "${state.userInputText} 🎉",
                    )
                  ],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
        SizedBox(
          height: context.dynamicHeight(30),
        ),
        Text(
          style: ThemeConstants.bodyMediumStyle,
          _bodyText,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        BlocBuilder<EmailOnboardingScreenCubit, EmailOnboardingScreenState>(
          builder: (context, state) {
            return CustomTextField(
              arrowEnabled: state.nextButtonEnabled,
              onChanged: BlocProvider.of<EmailOnboardingScreenCubit>(context)
                  .textFieldOnChanged,
              textFieldLabel: 'Phone',
              onArrowPressed: widget.onPressed,
              isPhoneField: true,
            );
          },
        ),
        const SizedBox(height: 50),
        Text.rich(
          TextSpan(
            text: _detailText,
            style: const TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Colors.white),
          ),
          style: ThemeConstants.bodySmallBoldStyle,
        ),
      ],
    );
  }
}
