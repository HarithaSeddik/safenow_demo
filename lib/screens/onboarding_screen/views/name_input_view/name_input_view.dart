import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:safenow_demo/utils/extensions/context_extensions.dart';

import '../../../../widgets/custom_text_field.dart';
import '../../widgets/terms_of_service.dart';
import 'cubit/name_input_view_cubit.dart';

class NameInputView extends StatefulWidget {
  const NameInputView({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  State<NameInputView> createState() => _NameInputViewState();
}

class _NameInputViewState extends State<NameInputView> {
  final String _titleText = "Let's get started. \n What's your name?";
  final String _firstNameString = "First name";

  @override
  Widget build(BuildContext context) {
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
                BlocBuilder<NameInputViewCubit, NameInputViewState>(
                  builder: (context, state) {
                    return CustomTextField(
                      arrowEnabled: state.nextButtonEnabled,
                      onChanged: BlocProvider.of<NameInputViewCubit>(context)
                          .textFieldOnChanged,
                      textFieldLabel: _firstNameString,
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
      ),
    );
  }
}
