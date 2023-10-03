import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'package:safenow_demo/utils/extensions/context_extensions.dart';
import 'package:safenow_demo/screens/onboarding_screen/views/name_input_view/cubit/name_input_view_cubit.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({super.key});

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  final String _termsOfService = "Terms Of Service";
  final String _privacyPolicy = "Privacy Policy.";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.multiplierWidth(0.83),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<NameInputViewCubit, NameInputViewState>(
            builder: (context, state) {
              return Center(
                  child: InkWell(
                onTap: () => BlocProvider.of<NameInputViewCubit>(context)
                    .toggleTermsOfService(),
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeConstants.primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: state.termsOfServiceAreAccepted
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
              ));
            },
          ),
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
