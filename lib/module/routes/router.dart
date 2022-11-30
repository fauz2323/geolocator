import 'package:auto_route/auto_route.dart';
import 'package:geolocator/module/pages/splash_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: Splash,
    ),
  ],
)
class $AppRouter {}
