// To parse this JSON data, do
//
//     final gameDetail = gameDetailFromJson(jsonString);

import 'dart:convert';

GameDetail gameDetailFromJson(String str) =>
    GameDetail.fromMap(json.decode(str));

String gameDetailToJson(GameDetail data) => json.encode(data.toJson());

class GameDetail {
  GameDetail({
    this.id,
    this.slug,
    this.name,
    this.nameOriginal,
    this.description,
    this.metacritic,
    this.metacriticPlatforms,
    this.released,
    this.tba,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.reactions,
    this.added,
    this.addedByStatus,
    this.playtime,
    this.screenshotsCount,
    this.moviesCount,
    this.creatorsCount,
    this.achievementsCount,
    this.parentAchievementsCount,
    this.redditUrl,
    this.redditName,
    this.redditDescription,
    this.redditLogo,
    this.redditCount,
    this.twitchCount,
    this.youtubeCount,
    this.reviewsTextCount,
    this.ratingsCount,
    this.suggestionsCount,
    this.alternativeNames,
    this.metacriticUrl,
    this.parentsCount,
    this.additionsCount,
    this.gameSeriesCount,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.parentPlatforms,
    this.platforms,
    this.stores,
    this.developers,
    this.genres,
    this.tags,
    this.publishers,
    this.esrbRating,
    this.clip,
    this.descriptionRaw,
  });

  int? id;
  String? slug;
  String? name;
  String? nameOriginal;
  String? description;
  dynamic metacritic;
  List<dynamic>? metacriticPlatforms;
  DateTime? released;
  bool? tba;
  DateTime? updated;
  String? backgroundImage;
  String? backgroundImageAdditional;
  String? website;
  double? rating;
  int? ratingTop;
  List<Rating>? ratings;
  Reactions? reactions;
  int? added;
  AddedByStatus? addedByStatus;
  int? playtime;
  int? screenshotsCount;
  int? moviesCount;
  int? creatorsCount;
  int? achievementsCount;
  int? parentAchievementsCount;
  String? redditUrl;
  String? redditName;
  String? redditDescription;
  String? redditLogo;
  int? redditCount;
  int? twitchCount;
  int? youtubeCount;
  int? reviewsTextCount;
  int? ratingsCount;
  int? suggestionsCount;
  List<dynamic>? alternativeNames;
  String? metacriticUrl;
  int? parentsCount;
  int? additionsCount;
  int? gameSeriesCount;
  dynamic userGame;
  int? reviewsCount;
  String? saturatedColor;
  String? dominantColor;
  List<ParentPlatform>? parentPlatforms;
  List<PlatformElement>? platforms;
  List<dynamic>? stores;
  List<Developer>? developers;
  List<Developer>? genres;
  List<Developer>? tags;
  List<Developer>? publishers;
  dynamic esrbRating;
  dynamic clip;
  String? descriptionRaw;

  factory GameDetail.fromMap(Map<String, dynamic> json) => GameDetail(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        metacritic: json["metacritic"],
        metacriticPlatforms: json["metacritic_platforms"] == null
            ? null
            : List<dynamic>.from(json["metacritic_platforms"].map((x) => x)),
        released:
            json["released"] == null ? null : DateTime.parse(json["released"]),
        tba: json["tba"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        website: json["website"],
        rating: json["rating"] ?? json["rating"].toDouble(),
        ratingTop: json["rating_top"],
        ratings: json["ratings"] == null
            ? null
            : List<Rating>.from(json["ratings"].map((x) => Rating.fromMap(x))),
        reactions: json["reactions"] == null
            ? null
            : Reactions.fromMap(json["reactions"]),
        added: json["added"],
        addedByStatus: json["added_by_status"] == null
            ? null
            : AddedByStatus.fromMap(json["added_by_status"]),
        playtime: json["playtime"],
        screenshotsCount: json["screenshots_count"],
        moviesCount: json["movies_count"],
        creatorsCount: json["creators_count"],
        achievementsCount: json["achievements_count"],
        parentAchievementsCount: json["parent_achievements_count"],
        redditUrl: json["reddit_url"],
        redditName: json["reddit_name"],
        redditDescription: json["reddit_description"],
        redditLogo: json["reddit_logo"],
        redditCount: json["reddit_count"],
        twitchCount: json["twitch_count"],
        youtubeCount: json["youtube_count"],
        reviewsTextCount: json["reviews_text_count"],
        ratingsCount: json["ratings_count"],
        suggestionsCount: json["suggestions_count"],
        alternativeNames: json["alternative_names"] == null
            ? null
            : List<dynamic>.from(json["alternative_names"].map((x) => x)),
        metacriticUrl: json["metacritic_url"],
        parentsCount: json["parents_count"],
        additionsCount: json["additions_count"],
        gameSeriesCount: json["game_series_count"],
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        parentPlatforms: json["parent_platforms"] == null
            ? null
            : List<ParentPlatform>.from(
                json["parent_platforms"].map((x) => ParentPlatform.fromMap(x))),
        platforms: json["platforms"] == null
            ? null
            : List<PlatformElement>.from(
                json["platforms"].map((x) => PlatformElement.fromMap(x))),
        stores: json["stores"] == null
            ? null
            : List<dynamic>.from(json["stores"].map((x) => x)),
        developers: json["developers"] == null
            ? null
            : List<Developer>.from(
                json["developers"].map((x) => Developer.fromMap(x))),
        genres: json["genres"] == null
            ? null
            : List<Developer>.from(
                json["genres"].map((x) => Developer.fromMap(x))),
        tags: json["tags"] == null
            ? null
            : List<Developer>.from(
                json["tags"].map((x) => Developer.fromMap(x))),
        publishers: json["publishers"] == null
            ? null
            : List<Developer>.from(
                json["publishers"].map((x) => Developer.fromMap(x))),
        esrbRating: json["esrb_rating"],
        clip: json["clip"],
        descriptionRaw: json["description_raw"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "name_original": nameOriginal,
        "description": description,
        "metacritic": metacritic,
        "metacritic_platforms": metacriticPlatforms == null
            ? null
            : List<dynamic>.from(metacriticPlatforms!.map((x) => x)),
        "released": released == null
            ? null
            : "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "updated": updated == null ? null : updated!.toIso8601String(),
        "background_image": backgroundImage,
        "background_image_additional": backgroundImageAdditional,
        "website": website,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": ratings == null
            ? null
            : List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "reactions": reactions == null ? null : reactions!.toJson(),
        "added": added,
        "added_by_status":
            addedByStatus == null ? null : addedByStatus!.toJson(),
        "playtime": playtime,
        "screenshots_count": screenshotsCount,
        "movies_count": moviesCount,
        "creators_count": creatorsCount,
        "achievements_count": achievementsCount,
        "parent_achievements_count": parentAchievementsCount,
        "reddit_url": redditUrl,
        "reddit_name": redditName,
        "reddit_description": redditDescription,
        "reddit_logo": redditLogo,
        "reddit_count": redditCount,
        "twitch_count": twitchCount,
        "youtube_count": youtubeCount,
        "reviews_text_count": reviewsTextCount,
        "ratings_count": ratingsCount,
        "suggestions_count": suggestionsCount,
        "alternative_names": alternativeNames == null
            ? null
            : List<dynamic>.from(alternativeNames!.map((x) => x)),
        "metacritic_url": metacriticUrl,
        "parents_count": parentsCount,
        "additions_count": additionsCount,
        "game_series_count": gameSeriesCount,
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "parent_platforms": parentPlatforms == null
            ? null
            : List<dynamic>.from(parentPlatforms!.map((x) => x.toJson())),
        "platforms": platforms == null
            ? null
            : List<dynamic>.from(platforms!.map((x) => x.toJson())),
        "stores":
            stores == null ? null : List<dynamic>.from(stores!.map((x) => x)),
        "developers": developers == null
            ? null
            : List<dynamic>.from(developers!.map((x) => x.toJson())),
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "publishers": publishers == null
            ? null
            : List<dynamic>.from(publishers!.map((x) => x.toJson())),
        "esrb_rating": esrbRating,
        "clip": clip,
        "description_raw": descriptionRaw,
      };
}

class AddedByStatus {
  AddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
    this.toplay,
    this.dropped,
  });

  int? yet;
  int? owned;
  int? beaten;
  int? toplay;
  int? dropped;

  factory AddedByStatus.fromMap(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
      );

  Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
      };
}

class Developer {
  Developer({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.language,
  });

  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;
  String? language;

  factory Developer.fromMap(Map<String, dynamic> json) => Developer(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "language": language,
      };
}

class ParentPlatform {
  ParentPlatform({
    this.platform,
  });

  ParentPlatformPlatform? platform;

  factory ParentPlatform.fromMap(Map<String, dynamic> json) => ParentPlatform(
        platform: json["platform"] == null
            ? null
            : ParentPlatformPlatform.fromMap(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform == null ? null : platform!.toJson(),
      };
}

class ParentPlatformPlatform {
  ParentPlatformPlatform({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  String? name;
  String? slug;

  factory ParentPlatformPlatform.fromMap(Map<String, dynamic> json) =>
      ParentPlatformPlatform(
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

class PlatformElement {
  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirements,
  });

  PlatformPlatform? platform;
  DateTime? releasedAt;
  Reactions? requirements;

  factory PlatformElement.fromMap(Map<String, dynamic> json) => PlatformElement(
        platform: json["platform"] == null
            ? null
            : PlatformPlatform.fromMap(json["platform"]),
        releasedAt: json["released_at"] == null
            ? null
            : DateTime.parse(json["released_at"]),
        requirements: json["requirements"] == null
            ? null
            : Reactions.fromMap(json["requirements"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform == null ? null : platform!.toJson(),
        "released_at": releasedAt == null
            ? null
            : "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}",
        "requirements": requirements == null ? null : requirements!.toJson(),
      };
}

class PlatformPlatform {
  PlatformPlatform({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });

  int? id;
  String? name;
  String? slug;
  dynamic image;
  dynamic yearEnd;
  dynamic yearStart;
  int? gamesCount;
  String? imageBackground;

  factory PlatformPlatform.fromMap(Map<String, dynamic> json) =>
      PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}

class Reactions {
  Reactions();

  factory Reactions.fromMap(Map<String, dynamic> json) => Reactions();

  Map<String, dynamic> toJson() => {};
}

class Rating {
  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  int? id;
  String? title;
  int? count;
  double? percent;

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"] ?? json["percent"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
      };
}
