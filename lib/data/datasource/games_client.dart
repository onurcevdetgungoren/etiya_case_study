import 'package:etiya_case_study/data/datasource/dio_client.dart';
import 'package:etiya_case_study/data/models/game.dart';
import 'package:etiya_case_study/data/models/game_detail.dart';
import 'package:etiya_case_study/domain/repositories/game_base.dart';
import 'package:etiya_case_study/locator.dart';

class GamesClient implements GameBase {
  final DioClient _dioClient = locator<DioClient>();
  final String apiKey = "db44f0a34ed24498a3d19b7133b7a571";

  //Get Games
  @override
  Future<Game> getGames(String page, String search, String pageSize,
      int platformId, String orderingItem) async {
    Map<String, dynamic> queryParameters;
    if (platformId != 0) {
      queryParameters = {
        "key": apiKey,
        "search": search,
        "page_size": pageSize,
        "page": page,
        "platforms": platformId,
        "ordering": orderingItem
      };
    } else {
      {
        queryParameters = {
          "key": apiKey,
          "search": search,
          "page_size": pageSize,
          "page": page,
          "ordering": orderingItem
        };
      }
    }
    try {
      var result =
          await _dioClient.dio.get("games?", queryParameters: queryParameters);
      var data = Game.fromMap(result.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  //Get Game Details
  @override
  Future<GameDetail> getGameDetail(String id) async {
    Map<String, dynamic> queryParameters;
    queryParameters = {"key": apiKey};
    try {
      var result = await _dioClient.dio
          .get("/games/$id", queryParameters: queryParameters);
      var data = GameDetail.fromMap(result.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
