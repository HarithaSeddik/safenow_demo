import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safenow_demo/constants/image_constants.dart';
import 'package:safenow_demo/constants/theme_constants.dart';
import 'package:safenow_demo/extensions/context_extensions.dart';

//  A custom page scaffold acts like a higher order component, or a wrapper for the Scaffold widget,  this helps us by keeping the code clean, and avoid repetitive code
class PageScaffold extends StatelessWidget {
  final bool isPrimary;
  final Widget scaffoldChild;
  final bool resizeToAvoidBottomInset;
  final EdgeInsets padding;
  final bool withDrawer;

  const PageScaffold({
    super.key,
    required this.scaffoldChild,
    this.isPrimary = true,
    this.resizeToAvoidBottomInset = true,
    this.padding = const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
    this.withDrawer = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isPrimary ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            size: 35,
          ),
          backgroundColor: Colors.transparent,
          systemOverlayStyle: isPrimary
              ? SystemUiOverlayStyle.dark
              : SystemUiOverlayStyle.light,
          automaticallyImplyLeading: false,
        ),
        endDrawer: withDrawer ? const NavDrawer() : null,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: Container(
          padding: padding,
          color: isPrimary
              ? ThemeConstants.primaryColor
              : ThemeConstants.secondaryColor,
          child: Center(
            child: scaffoldChild,
          ),
        ),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.multiplierWidth(0.81),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 40, left: 20),
                  child: Image.asset(
                    alignment: Alignment.topLeft,
                    ImageConstants.safeNowLogoImage,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discover SafeNow',
                        style: ThemeConstants.drawerSmallTextBold,
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.groups_outlined,
            ),
            title: const Text(
              'My Groups',
              style: ThemeConstants.drawerMediumText,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.access_alarm),
            title: const Text('Alarm History'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.question_answer_outlined),
            title: const Text('FAQ & Help'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.videogame_asset_outlined),
            title: const Text('Test Mode'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
