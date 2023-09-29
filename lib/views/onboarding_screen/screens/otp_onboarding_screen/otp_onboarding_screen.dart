import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:safenow_demo/constants/theme_constants.dart';
import 'package:safenow_demo/extensions/context_extensions.dart';
import 'package:safenow_demo/views/onboarding_screen/screens/email_onboarding_screen/cubit/email_onboarding_screen_cubit.dart';
import 'package:safenow_demo/views/onboarding_screen/screens/otp_onboarding_screen/cubit/otp_screen_cubit.dart';

class OtpOnboardingScreen extends StatefulWidget {
  const OtpOnboardingScreen({
    super.key,
  });

  @override
  State<OtpOnboardingScreen> createState() => _OtpOnboardingScreenState();
}

class _OtpOnboardingScreenState extends State<OtpOnboardingScreen> {
  final String _textPrompt = "Please enter the verification code we sent you.";

  final String _detailText = "Did not receive code? Resend";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpScreenCubit, OtpScreenState>(
      builder: (context, state) {
        return state is Loading
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Code is being verified...",
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
                  BlocBuilder<EmailOnboardingScreenCubit,
                      EmailOnboardingScreenState>(
                    builder: (context, state) {
                      return Text(
                        state.userEmailText ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  SizedBox(
                    height: context.dynamicHeight(150),
                  ),
                  BlocBuilder<OtpScreenCubit, OtpScreenState>(
                    builder: (context, state) {
                      return PinCodeTextField(
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
                        onChanged:
                            BlocProvider.of<OtpScreenCubit>(context).onType,
                      );
                    },
                  ),
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
              );
      },
    );
  }
}
