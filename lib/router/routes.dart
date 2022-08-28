import 'package:auto_route/auto_route.dart';
import 'package:etiya_case_study/presentation/screens/game_detail.dart';
import 'package:etiya_case_study/presentation/screens/games_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: GamesPage, initial: true),
    AutoRoute(page: GameDetailPage),
  ],
)
class $AppRouter {}
