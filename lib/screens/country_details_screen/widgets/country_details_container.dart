import 'package:flutter/cupertino.dart';
import 'package:safenow_demo/models/country_model.dart';
import 'package:safenow_demo/screens/country_details_screen/widgets/country_detail_card_widget.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'package:safenow_demo/utils/extensions/context_extensions.dart';

class CountryDetailsContainer extends StatelessWidget {
  const CountryDetailsContainer({
    super.key,
    required this.country,
    required this.isExpanded,
  });
  final CountryModel country;
  final bool isExpanded;
  final String _subtitleCapital = 'Capital';
  final String _subtitleLanguages = 'Languages';
  final String _subtitleContinent = 'Continent';
  final String _subtitleNative = 'Native';
  final String _subtitlePhone = 'Phone';
  final String _subtitleCurrency = 'Currency';

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn,
      width: context.multiplierWidth(0.8),
      height: isExpanded
          ? context.multiplierHeight(0.59)
          : context.multiplierHeight(0.33),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ThemeConstants.secondaryColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CountryDetailCardWidget(
                    titleText: country.capital ?? '',
                    subTitleText: _subtitleCapital,
                  ),
                  CountryDetailCardWidget(
                    titleText:
                        country.languages?.map((e) => e.name).join(" , ") ?? '',
                    subTitleText: _subtitleLanguages,
                  ),
                  CountryDetailCardWidget(
                    titleText: country.continent?.name ?? '',
                    subTitleText: _subtitleContinent,
                  ),
                  CountryDetailCardWidget(
                    titleText: country.native ?? '',
                    subTitleText: _subtitleNative,
                    isVisible: isExpanded,
                  ),
                  CountryDetailCardWidget(
                    titleText: "+(${country.phone}) ",
                    subTitleText: _subtitlePhone,
                    isVisible: isExpanded,
                  ),
                  CountryDetailCardWidget(
                    titleText: country.currency ?? '',
                    subTitleText: _subtitleCurrency,
                    isVisible: isExpanded,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
