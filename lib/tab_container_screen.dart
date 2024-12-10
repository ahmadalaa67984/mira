import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class TabContainerScreen extends StatelessWidget {
  const TabContainerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final l10n = AppLocalizations.of(context);
    final tabState = CupertinoTabPage.of(context);

    return CupertinoTabScaffold(
      controller: tabState.controller,
      tabBuilder: tabState.tabBuilder,
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            label: 'menu',
            icon: Icon(
              Icons.person,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(
              Icons.menu,
            ),
          ),
          BottomNavigationBarItem(
            label: 'menu',
            icon: Icon(
              Icons.format_quote,
            ),
          ),
        ],
      ),
    );
  }
}
