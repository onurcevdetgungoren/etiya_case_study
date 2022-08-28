import 'package:etiya_case_study/data/datasource/games_client.dart';
import 'package:etiya_case_study/data/models/game.dart';
import 'package:etiya_case_study/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupLocator();
  final gameClient = locator<GamesClient>();
  test("Get Games List", () async {
    final response =
        await gameClient.getGames("1", "max payne", "10", 4, "name");
    expect(response.results![0].stores is List<Store>, true);
  });

  test("Get Game Detail", () async {
    final response = await gameClient.getGameDetail("57177");
    expect(response.rating is double, true);
  });
}
