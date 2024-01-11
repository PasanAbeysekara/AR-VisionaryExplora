import 'package:ar_visionary_explora/features/authentication/controllers/splashScreen/splashScreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const Scaffold(
          body: Center(
              child: CircularProgressIndicator(
            color: Colors.purple,
          )),
        ));
  }
}
