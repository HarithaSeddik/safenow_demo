import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:safenow_demo/providers/switch_provider.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'package:safenow_demo/utils/extensions/context_extensions.dart';

class CustomSwitchWidget extends ConsumerWidget {
  const CustomSwitchWidget({super.key});
  final String _activeText = "Show less... ";
  final String _inactiveText = "Show More!";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchValue = ref.watch(switchStateProvider);
    return FlutterSwitch(
      value: switchValue,
      activeText: _activeText,
      inactiveText: _inactiveText,
      activeColor: ThemeConstants.primaryButtonColor,
      inactiveColor: ThemeConstants.secondaryButtonColor,
      activeToggleColor: ThemeConstants.primaryColor,
      inactiveToggleColor: ThemeConstants.primaryButtonColor,
      activeTextColor: ThemeConstants.primaryColor,
      inactiveTextColor: ThemeConstants.secondaryColor,
      inactiveSwitchBorder:
          Border.all(color: ThemeConstants.primaryButtonColor, width: 3),
      padding: 20,
      toggleSize: 70,
      valueFontSize: 20.0,
      width: context.multiplierWidth(0.65),
      height: context.multiplierHeight(0.09),
      borderRadius: 50.0,
      showOnOff: true,
      onToggle: (val) {
        //Inside onChange or onToggle callbacks, use the read method of a provider to not constantly listen to state changes for efficiency
        ref.read(switchStateProvider.notifier).state = !switchValue;
      },
      duration: const Duration(milliseconds: 200),
    );
  }
}
