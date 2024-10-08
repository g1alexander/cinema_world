class Person {
  String biography;
  String birthday;
  dynamic deathday;
  int id;
  String name;
  String placeOfBirth;
  String profilePath;

  Person({
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.id,
    required this.name,
    required this.placeOfBirth,
    required this.profilePath,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        biography: json["biography"] ?? '',
        birthday: json["birthday"] ?? '',
        deathday: json["deathday"] ?? '',
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        placeOfBirth: json["place_of_birth"] ?? '',
        profilePath: json["profile_path"] ?? 'no-poster',
      );
}

class Images {
  final int id;
  final List<Profile> profiles;

  Images({
    required this.id,
    required this.profiles,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"],
        profiles: List<Profile>.from(
            json["profiles"].map((x) => Profile.fromJson(x))),
      );
}

class Profile {
  final double aspectRatio;
  final int height;
  final dynamic iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  Profile({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
      };
}
