import 'package:etiya_case_study/data/datasource/games_client.dart';
import 'package:etiya_case_study/data/models/game.dart';
import 'package:etiya_case_study/data/models/game_detail.dart';
import 'package:etiya_case_study/domain/repositories/game_base.dart';
import 'package:etiya_case_study/locator.dart';

class GameRepository implements GameBase {
  final _gameClient = locator<GamesClient>();

  @override
  Future<Game> getGames(String page, String search, String pageSize,
      int platformId, String orderingItem) async {
    return _gameClient.getGames(
        page, search, pageSize, platformId, orderingItem);
  }

  @override
  Future<GameDetail> getGameDetail(String id) {
    return _gameClient.getGameDetail(id);
  }
}
