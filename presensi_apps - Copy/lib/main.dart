import 'package:flutter/material.dart';
import 'package:presensi_apps/locator.dart';
import 'package:presensi_apps/screen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setupServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreenPage());
      },
    );
  }
}
