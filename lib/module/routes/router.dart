import 'package:auto_route/annotations.dart';
import 'package:geolocator/module/pages/about_page.dart';
import 'package:geolocator/module/pages/category_page.dart';
import 'package:geolocator/module/pages/detail_faskes_page.dart';
import 'package:geolocator/module/pages/home_page.dart';
import 'package:geolocator/module/pages/splash_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: Splash, initial: true),
  MaterialRoute(page: HomePage),
  MaterialRoute(page: AboutPage),
  MaterialRoute(page: CategoryPage),
  MaterialRoute(page: DetailFaskesPage),
])
class $AppRouter {}
