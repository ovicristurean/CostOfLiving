import 'package:flutter/material.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var elements = ["one", "two", "three"];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: elements.length,
      itemBuilder: (context, index) {
        return Text(elements[index]);
      },
    );
  }
}
