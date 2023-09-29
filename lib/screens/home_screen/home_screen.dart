import 'package:flutter/material.dart';
import 'package:safenow_demo/config/image_constants.dart';
import 'package:safenow_demo/extensions/context_extensions.dart';
import 'package:safenow_demo/screens/widgets/custom_page_scaffold.dart';
import 'widgets/grid_item.dart';
import 'widgets/group_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      withDrawer: true,
      padding: const EdgeInsets.all(0),
      scaffoldChild: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageConstants.homeScreenMapImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white.withOpacity(0.2)],
                  ),
                ),
                height: 200,
                width: context.multiplierWidth(1),
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
            ),
          ],
        ),
      ),
    );
  }
}
