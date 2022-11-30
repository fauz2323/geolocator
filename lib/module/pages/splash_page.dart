import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    var route = AutoRouter.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => route.pushNamed('/home-page'),
      ),
      appBar: AppBar(
        title: Text("Splash"),
      ),
    );
  }
}
