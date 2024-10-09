class CreditsByActorResponse {
  final List<CastByActor> cast;
  final List<CastByActor> crew;
  final int id;

  CreditsByActorResponse({
    required this.cast,
    required this.crew,
    required this.id,
  });

  factory CreditsByActorResponse.fromJson(Map<String, dynamic> json) =>
      CreditsByActorResponse(
        cast: List<CastByActor>.from(
            json["cast"].map((x) => CastByActor.fromJson(x))),
        crew: List<CastByActor>.from(
            json["crew"].map((x) => CastByActor.fromJson(x))),
        id: json["id"],
      );
}

class CastByActor {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String? character;
  final String creditId;
  final int? order;
  final String? department;
  final String? job;
  final int? runtime;

  CastByActor({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
    this.runtime,
  });

  factory CastByActor.fromJson(Map<String, dynamic> json) => CastByActor(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] != null && json["release_date"] != ""
            ? DateTime.parse(json["release_date"])
            : DateTime.now(),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
        runtime: json["runtime"],
      );
}
