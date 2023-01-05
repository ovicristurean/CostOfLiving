import 'package:flutter/material.dart';

class LocationsErrorView extends StatelessWidget {
  final String message;

  const LocationsErrorView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }
}
