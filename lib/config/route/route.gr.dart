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
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../../presentation/pages/pages.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    Home_pagesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.Home_pagesPage(),
      );
    },
    Maps_pagesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.Maps_pagesPage(),
      );
    },
    About_pagesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.About_pagesPage(),
      );
    },
    Category_pagesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.Category_pagesPage(),
      );
    },
    Detail_pagesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.Detail_pagesPage(),
      );
    },
    Faskes_pagesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.Faskes_pagesPage(),
      );
    },
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        _i2.RouteConfig(
          SplashRoute.name,
          path: '/splash',
        ),
        _i2.RouteConfig(
          Home_pagesRoute.name,
          path: '/home',
        ),
        _i2.RouteConfig(
          Maps_pagesRoute.name,
          path: '/maps',
        ),
        _i2.RouteConfig(
          About_pagesRoute.name,
          path: '/about',
        ),
        _i2.RouteConfig(
          Category_pagesRoute.name,
          path: '/category',
        ),
        _i2.RouteConfig(
          Detail_pagesRoute.name,
          path: '/detail',
        ),
        _i2.RouteConfig(
          Faskes_pagesRoute.name,
          path: '/faskes',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i2.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i1.Home_pagesPage]
class Home_pagesRoute extends _i2.PageRouteInfo<void> {
  const Home_pagesRoute()
      : super(
          Home_pagesRoute.name,
          path: '/home',
        );

  static const String name = 'Home_pagesRoute';
}

/// generated route for
/// [_i1.Maps_pagesPage]
class Maps_pagesRoute extends _i2.PageRouteInfo<void> {
  const Maps_pagesRoute()
      : super(
          Maps_pagesRoute.name,
          path: '/maps',
        );

  static const String name = 'Maps_pagesRoute';
}

/// generated route for
/// [_i1.About_pagesPage]
class About_pagesRoute extends _i2.PageRouteInfo<void> {
  const About_pagesRoute()
      : super(
          About_pagesRoute.name,
          path: '/about',
        );

  static const String name = 'About_pagesRoute';
}

/// generated route for
/// [_i1.Category_pagesPage]
class Category_pagesRoute extends _i2.PageRouteInfo<void> {
  const Category_pagesRoute()
      : super(
          Category_pagesRoute.name,
          path: '/category',
        );

  static const String name = 'Category_pagesRoute';
}

/// generated route for
/// [_i1.Detail_pagesPage]
class Detail_pagesRoute extends _i2.PageRouteInfo<void> {
  const Detail_pagesRoute()
      : super(
          Detail_pagesRoute.name,
          path: '/detail',
        );

  static const String name = 'Detail_pagesRoute';
}

/// generated route for
/// [_i1.Faskes_pagesPage]
class Faskes_pagesRoute extends _i2.PageRouteInfo<void> {
  const Faskes_pagesRoute()
      : super(
          Faskes_pagesRoute.name,
          path: '/faskes',
        );

  static const String name = 'Faskes_pagesRoute';
}
