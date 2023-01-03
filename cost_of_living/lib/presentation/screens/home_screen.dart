import 'package:cost_of_living/presentation/widgets/locations_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "List of locations",
            textAlign: TextAlign.center,
          ),
          LocationsList(),
        ],
      ),
    );
  }
}
