// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/src/widgets/framework.dart' as _i8;

import '../pages/about_page.dart' as _i3;
import '../pages/category_page.dart' as _i4;
import '../pages/detail_faskes_page.dart' as _i5;
import '../pages/home_page.dart' as _i2;
import '../pages/splash_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.Splash(key: args.key),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    AboutPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AboutPage(),
      );
    },
    CategoryPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.CategoryPage(),
      );
    },
    DetailFaskesPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.DetailFaskesPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
        ),
        _i6.RouteConfig(
          AboutPageRoute.name,
          path: '/about-page',
        ),
        _i6.RouteConfig(
          CategoryPageRoute.name,
          path: '/category-page',
        ),
        _i6.RouteConfig(
          DetailFaskesPageRoute.name,
          path: '/detail-faskes-page',
        ),
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i6.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({_i8.Key? key})
      : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(key: key),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i6.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.AboutPage]
class AboutPageRoute extends _i6.PageRouteInfo<void> {
  const AboutPageRoute()
      : super(
          AboutPageRoute.name,
          path: '/about-page',
        );

  static const String name = 'AboutPageRoute';
}

/// generated route for
/// [_i4.CategoryPage]
class CategoryPageRoute extends _i6.PageRouteInfo<void> {
  const CategoryPageRoute()
      : super(
          CategoryPageRoute.name,
          path: '/category-page',
        );

  static const String name = 'CategoryPageRoute';
}

/// generated route for
/// [_i5.DetailFaskesPage]
class DetailFaskesPageRoute extends _i6.PageRouteInfo<void> {
  const DetailFaskesPageRoute()
      : super(
          DetailFaskesPageRoute.name,
          path: '/detail-faskes-page',
        );

  static const String name = 'DetailFaskesPageRoute';
}
