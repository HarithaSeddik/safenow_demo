import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:safenow_demo/extensions/context_extensions.dart';
import 'package:safenow_demo/views/onboarding_screen/screens/name_onboarding_screen/cubit/name_onboarding_screen_cubit.dart';
import 'package:safenow_demo/views/onboarding_screen/widgets/custom_text_field.dart';
import 'package:safenow_demo/views/onboarding_screen/widgets/terms_of_service.dart';

class NameOnboardingScreen extends StatefulWidget {
  const NameOnboardingScreen({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  State<NameOnboardingScreen> createState() => _NameOnboardingScreenState();
}

class _NameOnboardingScreenState extends State<NameOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 120),
          width: context.dynamicWidth(200),
          child: Text(
            "Let's get started. \n What's your name?",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: context.dynamicHeight(150),
        ),
        SizedBox(
          height: context.multiplierHeight(0.25),
          child: Column(
            children: [
              BlocBuilder<NameOnboardingScreenCubit, NameOnboardingScreenState>(
                builder: (context, state) {
                  return CustomTextField(
                    arrowEnabled: state.nextButtonEnabled,
                    onChanged:
                        BlocProvider.of<NameOnboardingScreenCubit>(context)
                            .textFieldOnChanged,
                    textFieldLabel: 'First name',
                    onArrowPressed: widget.onPressed,
                  );
                },
              ),
              SizedBox(
                height: context.dynamicHeight(30),
              ),
              const TermsOfService(),
            ],
          ),
        ),
      ],
    );
  }
}
