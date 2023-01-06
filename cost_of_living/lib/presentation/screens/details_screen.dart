import 'package:flutter/material.dart';

class LocationDetailsScreen extends StatelessWidget {
  final Color color;

  const LocationDetailsScreen({Key? key, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: color,
        child: const Center(
          child: Text("Details"),
        ),
      ),
    );
  }
}
