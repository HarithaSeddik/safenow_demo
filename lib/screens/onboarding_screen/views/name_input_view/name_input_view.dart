import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenow_demo/providers/onboarding_screen_providers.dart';

import 'package:safenow_demo/utils/extensions/context_extensions.dart';

import '../../../../widgets/custom_text_field.dart';
import '../../widgets/terms_of_service.dart';

class NameInputView extends ConsumerWidget {
  const NameInputView({super.key, required this.onPressed});
  final Function() onPressed;

  final String _titleText = "Let's get started. \n What's your name?";

  final String _firstNameString = "First name";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextButtonEnabled =
        ref.watch(nameInputViewProvider).nextButtonEnabled;
    return SizedBox(
      height: context.multiplierHeight(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 120),
            width: context.dynamicWidth(200),
            child: Text(
              _titleText,
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
                CustomTextField(
                  arrowEnabled: nextButtonEnabled,
                  onChanged: ref
                      .read(nameInputViewProvider.notifier)
                      .textFieldOnChanged,
                  textFieldLabel: _firstNameString,
                  onArrowPressed: onPressed,
                ),
                SizedBox(
                  height: context.dynamicHeight(30),
                ),
                const TermsOfService(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
