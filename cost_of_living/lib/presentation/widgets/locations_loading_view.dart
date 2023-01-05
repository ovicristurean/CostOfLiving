import 'package:flutter/material.dart';

class LocationsLoadingView extends StatelessWidget {
  final String message;

  const LocationsLoadingView({Key? key, required this.message}) : super(key: key);

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
