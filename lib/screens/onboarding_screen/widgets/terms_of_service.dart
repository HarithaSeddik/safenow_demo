import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenow_demo/providers/onboarding_screen_providers.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'package:safenow_demo/utils/extensions/context_extensions.dart';

class TermsOfService extends ConsumerWidget {
  const TermsOfService({super.key});

  final String _termsOfService = "Terms Of Service";

  final String _privacyPolicy = "Privacy Policy.";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool termsOfServiceState =
        ref.watch(nameInputViewProvider).termsOfServiceAreAccepted;
    return SizedBox(
      width: context.multiplierWidth(0.83),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: InkWell(
            onTap: () =>
                ref.read(nameInputViewProvider.notifier).toggleTermsOfService(),
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: ThemeConstants.primaryColor),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: termsOfServiceState
                    ? const Icon(
                        Icons.check,
                        size: 18.0,
                        color: ThemeConstants.secondaryColor,
                      )
                    : const Icon(
                        Icons.check_box_outline_blank,
                        size: 18.0,
                        color: ThemeConstants.primaryColor,
                      ),
              ),
            ),
          )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              height: context.dynamicHeight(70),
              child: Text.rich(
                TextSpan(
                  text: 'I have read and accept the ',
                  style: Theme.of(context).textTheme.bodySmall,
                  children: <TextSpan>[
                    TextSpan(
                      text: _termsOfService,
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white),
                    ),
                    TextSpan(
                      text:
                          " and agree to the processing of my data according to the ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: _privacyPolicy,
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
