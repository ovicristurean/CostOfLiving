import 'package:flutter/material.dart';

import 'waterfall_notched_rectangle.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 6,
      shape: WaterfallNotchedRectangle(),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Text("Locations"),
              onTap: () {
                Navigator.of(context).pushNamed('/details');
              },
            ),
            Text("TODO"),
            Text("TODO"),
          ],
        ),
      ),
    );
  }
}
