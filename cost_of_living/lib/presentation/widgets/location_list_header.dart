import 'package:flutter/material.dart';

class LocationsHeader extends StatefulWidget {
  const LocationsHeader({Key? key}) : super(key: key);

  @override
  State<LocationsHeader> createState() => _LocationsHeaderState();
}

class _LocationsHeaderState extends State<LocationsHeader> {
  double containerMargins = 8;
  Color containerColor = Colors.green;
  double containerRadius = 20;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animateContainer();
      },
      child: AnimatedContainer(
        margin: EdgeInsets.all(containerMargins),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(containerRadius),
        ),
        duration: const Duration(seconds: 1),
        child: const Text(
          "List of locations",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void animateContainer() {
    setState(() {
      containerMargins = containerMargins == 0 ? 8 : 0.0;
      containerColor =
          containerColor == Colors.green ? Colors.transparent : Colors.green;
      containerRadius = containerRadius == 20 ? 0.0 : 20;
    });
  }
}
