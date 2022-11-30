import 'package:flutter/material.dart';
import 'package:geolocator/module/routes/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRoute = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRoute.delegate(),
      routeInformationParser: _appRoute.defaultRouteParser(),
    );
  }
}
