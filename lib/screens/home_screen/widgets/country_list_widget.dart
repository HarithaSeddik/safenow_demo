import 'package:flutter/material.dart';
import 'package:safenow_demo/models/country_model.dart';
import 'package:safenow_demo/screens/country_details_screen/country_details_screen.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'package:safenow_demo/utils/extensions/context_extensions.dart';

class CountryListWidget extends StatelessWidget {
  const CountryListWidget({super.key, required this.countries});
  final List<CountryModel> countries;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.multiplierWidth(0.8),
      height: context.multiplierHeight(0.50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ThemeConstants.secondaryColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        children: [
          Expanded(
            //Remove default padding given by ListView
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return InkWell(
                    //User Navigator to push detail screen route
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CountryDetailsScreen(
                            countryModel: countries[index]))),
                    child: Card(
                      color: ThemeConstants.primaryColor,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          countries[index].name,
                          style: const TextStyle(
                              color: ThemeConstants.secondaryTextColor),
                        ),
                        subtitle: Text(
                          countries[index].code,
                          style: const TextStyle(
                              color: ThemeConstants.secondaryTextColor),
                        ),
                        trailing: RichText(
                          text: TextSpan(
                              text: countries[index].emoji,
                              style: const TextStyle(fontSize: 30)),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: countries.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
