import 'package:cost_of_living/presentation/router/app_router.dart';
import 'package:cost_of_living/presentation/screens/home_screen.dart';
import 'package:cost_of_living/ui_util/theme.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final settings = ValueNotifier(ThemeSettings(
      sourceColor: Colors.pink,
      themeMode: ThemeMode.system,
    ));

    final AppRouter appRouter = AppRouter();

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
                home: const MyHomePage(title: 'Flutter Demo Home Page'),
              );
            }),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
