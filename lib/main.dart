import 'package:flutter/material.dart';
import 'package:geolocator/config/config.dart';
import 'package:geolocator/config/route/route.gr.dart';
import 'package:geolocator/presentation/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: MyColors.mainColor,
      )),
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
