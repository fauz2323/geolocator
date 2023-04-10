import 'package:flutter/material.dart';
import 'package:geolocator_fe/presentation/pages/pages.dart';
import 'package:geolocator_fe/presentation/pages/splash/splash_view.dart';

import '../presentation/pages/faskes_pages_id/faskes_pages_view_id.dart';

class RoutesList {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashPage(),
    'home': (context) => const Home_pagesPage(),
    'category': (context) => Category_pagesPage(),
    'faskes': (context) => Faskes_pagesPage(),
    'detail': (context) => Detail_pagesPage(),
    'faskes_id': (context) => Faskes_pagesPage_id(),
    'maps': (context) => Maps_pagesPage(),
    'about': (context) => AboutPage(),
  };
}
