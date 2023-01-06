import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onPageSelected;

  const AppBottomNavigationBar({Key? key, required this.onPageSelected})
      : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
          widget.onPageSelected(index);
        });
      },
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.explore),
          label: 'Locations',
        ),
        NavigationDestination(
          icon: Icon(Icons.commute),
          label: 'TODO',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.bookmark),
          icon: Icon(Icons.bookmark_border),
          label: 'TODO',
        ),
      ],
    );
  }
}
