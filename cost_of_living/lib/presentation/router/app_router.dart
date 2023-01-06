import 'package:cost_of_living/presentation/screens/details_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/details':
        return MaterialPageRoute(
          builder: (_) => const LocationDetailsScreen(color: Colors.yellow),
        );
      default:
        return null;
    }
  }

  void dispose() {

  }
}
