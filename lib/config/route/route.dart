import 'package:auto_route/auto_route.dart';
import 'package:geolocator_fe/presentation/pages/pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashPage,
      path: '/splash',
      initial: true,
    ),

    AutoRoute(page: Home_pagesPage, path: '/home'),
    AutoRoute(page: Maps_pagesPage, path: '/maps'),
    AutoRoute(page: About_pagesPage, path: '/about'),
    AutoRoute(page: Category_pagesPage, path: '/category'),
    AutoRoute(page: Detail_pagesPage, path: '/detail'),
    AutoRoute(page: Faskes_pagesPage, path: '/faskes'),
    // AutoRoute(page: NotFoundPage, path: '*', name: 'NotFoundPage'),
  ],
)
// extend the generated private router
class $AppRouter {}
