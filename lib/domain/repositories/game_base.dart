import 'package:etiya_case_study/data/models/game.dart';
import 'package:etiya_case_study/data/models/game_detail.dart';

abstract class GameBase {
  Future<Game> getGames(String page, String search, String pageSize,
      int platformId, String orderingItem);
  Future<GameDetail> getGameDetail(String id);
}
