// To parse this JSON data, do
//
//     final filter = filterFromJson(jsonString);

import 'dart:convert';

Filter filterFromJson(String str) => Filter.fromMap(json.decode(str));

String filterToJson(Filter data) => json.encode(data.toJson());

class Filter {
  Filter({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;

  factory Filter.fromMap(Map<String, dynamic> json) => Filter(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.image,
    this.yearStart,
    this.yearEnd,
    this.games,
  });

  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;
  dynamic image;
  int? yearStart;
  dynamic yearEnd;
  List<Game>? games;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        image: json["image"],
        yearStart: json["year_start"],
        yearEnd: json["year_end"],
        games: json["games"] == null
            ? null
            : List<Game>.from(json["games"].map((x) => Game.fromMap(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "image": image,
        "year_start": yearStart,
        "year_end": yearEnd,
        "games": games == null
            ? null
            : List<dynamic>.from(games!.map((x) => x.toJson())),
      };
}

class Game {
  Game({
    this.id,
    this.slug,
    this.name,
    this.added,
  });

  int? id;
  String? slug;
  String? name;
  int? added;

  factory Game.fromMap(Map<String, dynamic> json) => Game(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        added: json["added"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "added": added,
      };
}
