import 'package:flutter/material.dart';
import 'package:safenow_demo/constants/theme_constants.dart';
import 'package:safenow_demo/extensions/context_extensions.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.textFieldLabel,
    required this.onArrowPressed,
    required this.onChanged,
    required this.arrowEnabled,
    this.isPhoneField = false,
  });

  final String textFieldLabel;
  final Function onArrowPressed;
  final Function onChanged;
  final bool arrowEnabled;
  final bool isPhoneField;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    if (widget.isPhoneField) _controller.text = "(+90) ";
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: context.multiplierWidth(0.85),
      child: Stack(
          alignment: Alignment.centerLeft,
          textDirection: TextDirection.ltr,
          children: [
            Positioned(
              child: TextFormField(
                keyboardType: widget.isPhoneField ? TextInputType.number : null,
                cursorColor: Colors.white,
                cursorHeight: 30,
                style: widget.isPhoneField
                    ? ThemeConstants.labelSmall
                    : ThemeConstants.labelMedium,
                controller: _controller,
                onChanged: (value) => widget.onChanged.call(value),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    width: 2,
                    color: Colors.blue,
                  )),
                ),
              ),
            ),
            Positioned(
              top: 10,
              child: Text(
                widget.textFieldLabel,
                style: ThemeConstants.bodySmallBoldStyle,
              ),
            ),
            Positioned(
                right: 0,
                top: 20,
                child: InkWell(
                  onTap: widget.arrowEnabled
                      ? () => {
                            widget.onArrowPressed.call(),
                            FocusManager.instance.primaryFocus?.unfocus(),
                          }
                      : () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: widget.arrowEnabled
                          ? Colors.white
                          : Colors.white.withOpacity(0.3),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_sharp,
                      size: 30,
                      color: ThemeConstants.secondaryColor,
                    ),
                  ),
                )),
          ]),
    );
  }
}
