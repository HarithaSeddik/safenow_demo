import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenow_demo/models/country_model.dart';
import 'package:safenow_demo/providers/data_provider.dart';
import 'package:safenow_demo/screens/home_screen/widgets/country_list_widget.dart';
import 'package:safenow_demo/widgets/custom_page_scaffold.dart';
import 'widgets/grid_item.dart';
import 'widgets/group_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      withDrawer: true,
      padding: EdgeInsets.only(top: 60),
      //Render widgets based on async state values
      scaffoldChild: HomeScreenBody(),
      withBgImage: true,
    );
  }
}

class HomeScreenBody extends ConsumerWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // call upon Future provider to retrieve the async value result
    final allCountriesData = ref.watch(countriesDataProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
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
        //Use the Async Value result to render widgets based on state
        allCountriesData.when(
            data: (data) {
              List<CountryModel> countryList = data.map((e) => e).toList();
              return CountryListWidget(countries: countryList);
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const CircularProgressIndicator()),
      ],
    );
  }
}
