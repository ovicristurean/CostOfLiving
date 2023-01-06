import 'package:cost_of_living/presentation/screens/details_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import '../../ui_util/theme.dart';
import '../router/app_router.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final settings = ValueNotifier(ThemeSettings(
    sourceColor: Colors.pink,
    themeMode: ThemeMode.system,
  ));

  final AppRouter appRouter = AppRouter();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) =>
          ThemeProvider(
        settings: settings,
        lightDynamic: lightDynamic,
        darkDynamic: darkDynamic,
        child: ValueListenableBuilder(
            valueListenable: settings,
            builder: (context, value, _) {
              final theme = ThemeProvider.of(context);
              return MaterialApp(
                title: 'Flutter Demo',
                theme: theme.light(settings.value.sourceColor),
                darkTheme: theme.dark(settings.value.sourceColor),
                themeMode: theme.themeMode(),
                onGenerateRoute: appRouter.onGenerateRoute,
                home: Scaffold(
                  body: <Widget>[
                    const HomeScreen(),
                    const LocationDetailsScreen(color: Colors.green),
                    const LocationDetailsScreen(color:Colors.yellow),
                  ][selectedIndex],
                  //HomeScreen(),
                  bottomNavigationBar: AppBottomNavigationBar(
                    onPageSelected: (selectedPageIndex) {
                      setState(() {
                        selectedIndex = selectedPageIndex;
                      });
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
