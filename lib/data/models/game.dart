// To parse this JSON data, do
//
//     final game = gamefromMap(jsonString);

import 'dart:convert';

Game gamefromMap(String str) => Game.fromMap(json.decode(str));

String gameToJson(Game data) => json.encode(data.toJson());

class Game {
  Game({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.userPlatforms,
  });

  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;
  bool? userPlatforms;

  factory Game.fromMap(Map<String, dynamic> json) => Game(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        userPlatforms: json["user_platforms"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "user_platforms": userPlatforms,
      };
}

class Result {
  Result({
    this.slug,
    this.name,
    this.playtime,
    this.platforms,
    this.stores,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.suggestionsCount,
    this.updated,
    this.id,
    this.score,
    this.clip,
    this.tags,
    this.esrbRating,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.shortScreenshots,
    this.parentPlatforms,
    this.genres,
  });

  String? slug;
  String? name;
  int? playtime;
  List<Platform>? platforms;
  List<Store>? stores;
  DateTime? released;
  bool? tba;
  String? backgroundImage;
  double? rating;
  int? ratingTop;
  List<Rating>? ratings;
  int? ratingsCount;
  int? reviewsTextCount;
  int? added;
  AddedByStatus? addedByStatus;
  int? metacritic;
  int? suggestionsCount;
  DateTime? updated;
  int? id;
  String? score;
  dynamic clip;
  List<Tag>? tags;
  EsrbRating? esrbRating;
  dynamic userGame;
  int? reviewsCount;
  Color? saturatedColor;
  Color? dominantColor;
  List<ShortScreenshot>? shortScreenshots;
  List<Platform>? parentPlatforms;
  List<Genre>? genres;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        slug: json["slug"],
        name: json["name"],
        playtime: json["playtime"],
        platforms: json["platforms"] == null
            ? null
            : List<Platform>.from(
                json["platforms"].map((x) => Platform.fromMap(x))),
        stores: json["stores"] == null
            ? null
            : List<Store>.from(json["stores"].map((x) => Store.fromMap(x))),
        released:
            json["released"] == null ? null : DateTime.parse(json["released"]),
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"] ?? json["rating"].toDouble(),
        ratingTop: json["rating_top"],
        ratings: json["ratings"] == null
            ? null
            : List<Rating>.from(json["ratings"].map((x) => Rating.fromMap(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        addedByStatus: json["added_by_status"] == null
            ? null
            : AddedByStatus.fromMap(json["added_by_status"]),
        metacritic: json["metacritic"],
        suggestionsCount: json["suggestions_count"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        id: json["id"],
        score: json["score"],
        clip: json["clip"],
        tags: json["tags"] == null
            ? null
            : List<Tag>.from(json["tags"].map((x) => Tag.fromMap(x))),
        esrbRating: json["esrb_rating"] == null
            ? null
            : EsrbRating.fromMap(json["esrb_rating"]),
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"] == null
            ? null
            : colorValues.map![json["saturated_color"]],
        dominantColor: json["dominant_color"] == null
            ? null
            : colorValues.map![json["dominant_color"]],
        shortScreenshots: json["short_screenshots"] == null
            ? null
            : List<ShortScreenshot>.from(json["short_screenshots"]
                .map((x) => ShortScreenshot.fromMap(x))),
        parentPlatforms: json["parent_platforms"] == null
            ? null
            : List<Platform>.from(
                json["parent_platforms"].map((x) => Platform.fromMap(x))),
        genres: json["genres"] == null
            ? null
            : List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "playtime": playtime,
        "platforms": platforms == null
            ? null
            : List<dynamic>.from(platforms!.map((x) => x.toJson())),
        "stores": stores == null
            ? null
            : List<dynamic>.from(stores!.map((x) => x.toJson())),
        "released": released == null
            ? null
            : "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": ratings == null
            ? null
            : List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status":
            addedByStatus == null ? null : addedByStatus!.toJson(),
        "metacritic": metacritic,
        "suggestions_count": suggestionsCount,
        "updated": updated == null ? null : updated!.toIso8601String(),
        "id": id,
        "score": score,
        "clip": clip,
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "esrb_rating": esrbRating == null ? null : esrbRating!.toJson(),
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color":
            saturatedColor == null ? null : colorValues.reverse[saturatedColor],
        "dominant_color":
            dominantColor == null ? null : colorValues.reverse[dominantColor],
        "short_screenshots": shortScreenshots == null
            ? null
            : List<dynamic>.from(shortScreenshots!.map((x) => x.toJson())),
        "parent_platforms": parentPlatforms == null
            ? null
            : List<dynamic>.from(parentPlatforms!.map((x) => x.toJson())),
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
      };
}

class AddedByStatus {
  AddedByStatus({
    this.owned,
    this.beaten,
    this.dropped,
    this.yet,
    this.toplay,
    this.playing,
  });

  int? owned;
  int? beaten;
  int? dropped;
  int? yet;
  int? toplay;
  int? playing;

  factory AddedByStatus.fromMap(Map<String, dynamic> json) => AddedByStatus(
        owned: json["owned"],
        beaten: json["beaten"],
        dropped: json["dropped"],
        yet: json["yet"],
        toplay: json["toplay"],
        playing: json["playing"],
      );

  Map<String, dynamic> toJson() => {
        "owned": owned,
        "beaten": beaten,
        "dropped": dropped,
        "yet": yet,
        "toplay": toplay,
        "playing": playing,
      };
}

enum Color { THE_0_F0_F0_F }

final colorValues = EnumValues({"0f0f0f": Color.THE_0_F0_F0_F});

class EsrbRating {
  EsrbRating({
    this.id,
    this.name,
    this.slug,
    this.nameEn,
    this.nameRu,
  });

  int? id;
  String? name;
  String? slug;
  String? nameEn;
  String? nameRu;

  factory EsrbRating.fromMap(Map<String, dynamic> json) => EsrbRating(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        nameEn: json["name_en"],
        nameRu: json["name_ru"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "name_en": nameEn,
        "name_ru": nameRu,
      };
}

class Genre {
  Genre({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  String? name;
  String? slug;

  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Platform {
  Platform({
    this.platform,
  });

  Genre? platform;

  factory Platform.fromMap(Map<String, dynamic> json) => Platform(
        platform:
            json["platform"] == null ? null : Genre.fromMap(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform == null ? null : platform!.toJson(),
      };
}

class Rating {
  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  int? id;
  Title? title;
  int? count;
  double? percent;

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"] == null ? null : titleValues.map![json["title"]],
        count: json["count"],
        percent: json["percent"] ?? json["percent"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title == null ? null : titleValues.reverse[title],
        "count": count,
        "percent": percent,
      };
}

enum Title { EXCEPTIONAL, RECOMMENDED, MEH, SKIP }

final titleValues = EnumValues({
  "exceptional": Title.EXCEPTIONAL,
  "meh": Title.MEH,
  "recommended": Title.RECOMMENDED,
  "skip": Title.SKIP
});

class ShortScreenshot {
  ShortScreenshot({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory ShortScreenshot.fromMap(Map<String, dynamic> json) => ShortScreenshot(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class Store {
  Store({
    this.store,
  });

  Genre? store;

  factory Store.fromMap(Map<String, dynamic> json) => Store(
        store: json["store"] == null ? null : Genre.fromMap(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "store": store == null ? null : store!.toJson(),
      };
}

class Tag {
  Tag({
    this.id,
    this.name,
    this.slug,
    this.language,
    this.gamesCount,
    this.imageBackground,
  });

  int? id;
  String? name;
  String? slug;
  Language? language;
  int? gamesCount;
  String? imageBackground;

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        language: json["language"] == null
            ? null
            : languageValues.map![json["language"]],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "language": language == null ? null : languageValues.reverse[language],
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}

enum Language { ENG, RUS }

final languageValues = EnumValues({"eng": Language.ENG, "rus": Language.RUS});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
