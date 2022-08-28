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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:etiya_case_study/presentation/screens/game_detail.dart' as _i2;
import 'package:etiya_case_study/presentation/screens/games_page.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    GamesRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.GamesPage());
    },
    GameDetailRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.GameDetailPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(GamesRoute.name, path: '/'),
        _i3.RouteConfig(GameDetailRoute.name, path: '/game-detail-page')
      ];
}

/// generated route for
/// [_i1.GamesPage]
class GamesRoute extends _i3.PageRouteInfo<void> {
  const GamesRoute() : super(GamesRoute.name, path: '/');

  static const String name = 'GamesRoute';
}

/// generated route for
/// [_i2.GameDetailPage]
class GameDetailRoute extends _i3.PageRouteInfo<void> {
  const GameDetailRoute()
      : super(GameDetailRoute.name, path: '/game-detail-page');

  static const String name = 'GameDetailRoute';
}
