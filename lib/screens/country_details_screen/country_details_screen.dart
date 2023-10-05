import 'package:flutter/material.dart';
import 'package:safenow_demo/models/country_model.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'package:safenow_demo/widgets/custom_page_scaffold.dart';

class CountryDetailsScreen extends StatelessWidget {
  const CountryDetailsScreen({super.key, required this.countryModel});
  final CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      withBackNavigation: true,
      scaffoldChild: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ThemeConstants.secondaryColor,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: countryModel.emoji,
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                countryModel.name,
                style: const TextStyle(
                  color: ThemeConstants.secondaryColor,
                ),
              ),
              Text(
                countryModel.code,
                style: const TextStyle(
                  color: ThemeConstants.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
