import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:safenow_demo/providers/onboarding_screen_providers.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'package:safenow_demo/utils/extensions/context_extensions.dart';
import 'cubit/otp_view_cubit.dart';

class OtpView extends ConsumerWidget {
  const OtpView({
    super.key,
  });

  final String _textPrompt = "Please enter the verification code we sent you.";

  final String _detailText = "Did not receive code? Resend";

  final String _loadingText = "Code is being verified...";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(otpViewProvider);
    return SizedBox(
      height: context.multiplierHeight(1),
      child: state is Loading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    _loadingText,
                    style: ThemeConstants.titleMediumStyle,
                  )
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 120),
                  width: context.multiplierWidth(0.85),
                  child: Text(
                    _textPrompt,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  ref.watch(phoneInputViewProvider).userPhoneNumber ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: context.dynamicHeight(150),
                ),
                PinCodeTextField(
                    autoFocus: state is Initial,
                    cursorColor: Colors.white,
                    pinTheme: ThemeConstants.pinTheme,
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: ThemeConstants.primaryColor,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    appContext: context,
                    length: 6,
                    enabled: true,
                    onChanged: ref.read(otpViewProvider.notifier).onType),
                const SizedBox(
                  height: 35,
                ),
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
