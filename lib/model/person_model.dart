import 'dart:convert';

PersonModel personsResponseFromJson(String str) =>
    PersonModel.fromJson(json.decode(str));

String personsResponseToJson(PersonModel data) => json.encode(data.toJson());

class PersonModel {
  PersonModel({
    required this.results,
  });

  List<Result> results;

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.known_for_department,
    required this.name,
    required this.popularity,
    required this.profilePath,
  });

  int gender;
  int id;
  List<KnownFor> knownFor;
  String known_for_department;
  String name;
  double popularity;
  String profilePath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        gender: json["gender"],
        id: json["id"],
        knownFor: List<KnownFor>.from(
            json["known_for"].map((x) => KnownFor.fromJson(x))),
        known_for_department: json["known_for_department"],
        name: json["name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "id": id,
        "known_for": List<dynamic>.from(knownFor.map((x) => x.toJson())),
        "known_for_department": known_for_department,
        "name": name,
        "popularity": popularity,
        "profile_path": profilePath,
      };
}

class KnownFor {
  KnownFor({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.media_type,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.name,
    required this.originalName,
  });

  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String media_type;
  String originalTitle;
  String overview;
  String posterPath;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  String name;
  String originalName;

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        media_type: json["media_type"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "media_type": media_type,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
      };
}
