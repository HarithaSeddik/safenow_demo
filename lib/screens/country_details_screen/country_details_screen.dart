import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenow_demo/models/country_model.dart';
import 'package:safenow_demo/providers/data_provider.dart';
import 'package:safenow_demo/providers/switch_provider.dart';
import 'package:safenow_demo/screens/country_details_screen/widgets/country_details_container.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'package:safenow_demo/widgets/custom_page_scaffold.dart';
import 'widgets/custom_switch_widget.dart';

class CountryDetailsScreen extends ConsumerWidget {
  const CountryDetailsScreen({super.key, required this.prevCountryModel});
  final CountryModel prevCountryModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryModelVal =
        ref.watch(getCountryByCodeDataProvider(prevCountryModel.code));
    final switchValue = ref.watch(switchStateProvider);

    return PageScaffold(
      withBgImage: true,
      withBgImageOpacity: true,
      withBackNavigation: true,
      padding: const EdgeInsets.only(top: 100, bottom: 50, left: 20, right: 20),
      scaffoldChild: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 80,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeConstants.secondaryColor.withOpacity(0.2),
                  border: Border.all(
                      color: ThemeConstants.secondaryColor, width: 4),
                ),
                child: RichText(
                  text: TextSpan(
                    text: prevCountryModel.emoji,
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${prevCountryModel.name} - [ ${prevCountryModel.code} ] ',
                style: const TextStyle(
                  color: ThemeConstants.secondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          countryModelVal.when(
            data: (data) => data != null
                ? CountryDetailsContainer(
                    country: data,
                    isExpanded: switchValue,
                  )
                : Container(),
            error: (err, s) => Text(err.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
          const Spacer(),
          const CustomSwitchWidget(),
        ],
      ),
    );
  }
}
