import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safenow_demo/utils/constants/image_constants.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';
import 'package:safenow_demo/utils/extensions/context_extensions.dart';

//  A custom page scaffold acts like a higher order component, or a wrapper for the Scaffold widget,  this helps us by keeping the code clean, and avoid repetitive code
class PageScaffold extends StatelessWidget {
  final bool isPrimary;
  final Widget scaffoldChild;
  final bool resizeToAvoidBottomInset;
  final EdgeInsets padding;
  final bool withDrawer;
  final bool withBackNavigation;
  final bool withBgImage;
  final bool withBgImageOpacity;

  const PageScaffold({
    super.key,
    required this.scaffoldChild,
    this.isPrimary = true,
    this.resizeToAvoidBottomInset = true,
    this.padding = const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
    this.withDrawer = false,
    this.withBackNavigation = false,
    this.withBgImage = false,
    this.withBgImageOpacity = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isPrimary ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          iconTheme: const IconThemeData(
            size: 35,
          ),
          backgroundColor: Colors.transparent,
          systemOverlayStyle: isPrimary
              ? SystemUiOverlayStyle.dark
              : SystemUiOverlayStyle.light,
          automaticallyImplyLeading: withBackNavigation,
        ),
        endDrawer: withDrawer ? const NavDrawer() : null,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: Container(
          padding: padding,
          height: withBgImage ? context.multiplierHeight(1) : null,
          decoration: withBgImage
              ? BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: const AssetImage(
                      ImageConstants.homeScreenMapOverlay,
                    ),
                    fit: BoxFit.cover,
                    opacity: withBgImageOpacity ? 0.3 : 1,
                  ),
                  color: isPrimary
                      ? ThemeConstants.primaryColor
                      : ThemeConstants.secondaryColor,
                )
              : BoxDecoration(
                  color: isPrimary
                      ? ThemeConstants.primaryColor
                      : ThemeConstants.secondaryColor,
                ),
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

  final String _drawerTitle = 'Discover SafeNow';
  final String _listTileText1 = 'My Groups';
  final String _listTileText2 = 'Settings';
  final String _listTileText3 = 'Alarm History';
  final String _listTileText4 = 'FAQ & Help';
  final String _listTileText5 = 'Test Mode';
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _drawerTitle,
                        style: ThemeConstants.drawerSmallTextBold,
                      ),
                      const Icon(Icons.keyboard_arrow_down),
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
            title: Text(
              _listTileText1,
              style: ThemeConstants.drawerMediumText,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(_listTileText2),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.access_alarm),
            title: Text(_listTileText3),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.question_answer_outlined),
            title: Text(_listTileText4),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.videogame_asset_outlined),
            title: Text(_listTileText5),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
