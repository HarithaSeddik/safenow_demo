import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';

import 'package:safenow_demo/utils/extensions/context_extensions.dart';
import 'package:safenow_demo/screens/onboarding_screen/views/name_input_view/cubit/name_input_view_cubit.dart';
import '../../../../widgets/custom_text_field.dart';
import 'cubit/phone_input_view_cubit.dart';

class PhoneInputView extends StatefulWidget {
  const PhoneInputView({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

  @override
  State<PhoneInputView> createState() => _PhoneInputViewState();
}

class _PhoneInputViewState extends State<PhoneInputView> {
  final String _titleText = "Nice to meet you, ";
  final String _bodyText =
      "To make sure that you are a real person, please enter your phone number here: ";
  final String _detailText = "Why do you need my phone number? ";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.multiplierHeight(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            width: context.dynamicWidth(200),
            child: BlocBuilder<NameInputViewCubit, NameInputViewState>(
              bloc: BlocProvider.of<NameInputViewCubit>(context),
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
          BlocBuilder<PhoneInputViewCubit, PhoneInputViewState>(
            builder: (context, state) {
              return CustomTextField(
                arrowEnabled: state.nextButtonEnabled,
                onChanged: BlocProvider.of<PhoneInputViewCubit>(context)
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
      ),
    );
  }
}
