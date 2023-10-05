import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenow_demo/models/country_model.dart';
import 'package:safenow_demo/providers/data_provider.dart';
import 'package:safenow_demo/screens/home_screen/widgets/country_list_widget.dart';
import 'package:safenow_demo/utils/constants/image_constants.dart';
import 'package:safenow_demo/utils/extensions/context_extensions.dart';
import 'package:safenow_demo/widgets/custom_page_scaffold.dart';
import 'widgets/grid_item.dart';
import 'widgets/group_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCountriesData = ref.watch(countriesDataProvider);
    return PageScaffold(
      withDrawer: true,
      padding: const EdgeInsets.only(top: 60),
      scaffoldChild: allCountriesData.when(
          data: (data) {
            List<CountryModel> countryList = data.map((e) => e).toList();
            return HomeScreenBody(countryList: countryList);
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const CircularProgressIndicator()),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key, required this.countryList});
  final List<CountryModel> countryList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.multiplierHeight(1),
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.bottomCenter,
          image: AssetImage(
            ImageConstants.homeScreenMapOverlay,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white.withOpacity(0.5)],
              ),
            ),
            child: const Column(
              children: [
                Row(
                  children: [
                    GridItem(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GroupWidget(),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          CountryListWidget(countries: countryList),
        ],
      ),
    );
  }
}
