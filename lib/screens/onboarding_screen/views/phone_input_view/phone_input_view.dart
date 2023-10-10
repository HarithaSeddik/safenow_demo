import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenow_demo/providers/onboarding_screen_providers.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'package:safenow_demo/utils/extensions/context_extensions.dart';
import '../../../../widgets/custom_text_field.dart';

class PhoneInputView extends ConsumerWidget {
  const PhoneInputView({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

  final String _titleText = "Nice to meet you, ";

  final String _bodyText =
      "To make sure that you are a real person, please enter your phone number here: ";

  final String _detailText = "Why do you need my phone number? ";

  final String _phoneTextLabel = "Phone";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInputText = ref.watch(nameInputViewProvider).userInputText;
    final nextButtonEnabled =
        ref.watch(phoneInputViewProvider).nextButtonEnabled;
    return SizedBox(
      height: context.multiplierHeight(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            width: context.dynamicWidth(200),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: _titleText,
                  ),
                  TextSpan(
                    text: "$userInputText 🎉",
                  )
                ],
                style: Theme.of(context).textTheme.titleMedium,
              ),
              textAlign: TextAlign.center,
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
          CustomTextField(
            arrowEnabled: nextButtonEnabled,
            onChanged:
                ref.read(phoneInputViewProvider.notifier).textFieldOnChanged,
            textFieldLabel: _phoneTextLabel,
            onArrowPressed: onPressed,
            isPhoneField: true,
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
