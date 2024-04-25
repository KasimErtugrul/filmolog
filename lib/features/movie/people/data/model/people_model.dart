import 'package:filmolog/features/movie/people/domain/domain.dart';

class PeopleModel extends PeopleEntity {
  const PeopleModel({
    super.adult,
    super.alsoKnownAs,
    super.biography,
    super.birthday,
    super.deathday,
    super.gender,
    super.homepage,
    super.id,
    super.imdbId,
    super.knownForDepartment,
    super.name,
    super.placeOfBirth,
    super.popularity,
    super.profilePath,
    super.combinedCredits,
    super.externalIds,
    super.images,
    super.movieCredits,
    super.taggedImages,
    super.tvCredits,
  });

  factory PeopleModel.fromMap(Map<String, dynamic> json) => PeopleModel(
        adult: json["adult"],
        alsoKnownAs: json["also_known_as"] == null
            ? []
            : List<String>.from(json["also_known_as"]!.map((x) => x)),
        biography: json["biography"],
        birthday: json["birthday"],
        deathday: json["deathday"],
        gender: json["gender"],
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        combinedCredits: json["combined_credits"] == null
            ? null
            : CombinedCredits.fromMap(json["combined_credits"]),
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromMap(json["external_ids"]),
        images: json["images"] == null ? null : Images.fromMap(json["images"]),
        movieCredits: json["movie_credits"] == null
            ? null
            : MovieCredits.fromMap(json["movie_credits"]),
        taggedImages: json["tagged_images"] == null
            ? null
            : TaggedImages.fromMap(json["tagged_images"]),
        tvCredits: json["tv_credits"] == null
            ? null
            : TvCredits.fromMap(json["tv_credits"]),
      );

  @override
  Map<String, dynamic> toMap() => {
        "adult": adult,
        "also_known_as": alsoKnownAs == null
            ? []
            : List<dynamic>.from(alsoKnownAs!.map((x) => x)),
        "biography": biography,
        "birthday": birthday,
        "deathday": deathday,
        "gender": gender,
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "known_for_department": knownForDepartment,
        "name": name,
        "place_of_birth": placeOfBirth,
        "popularity": popularity,
        "profile_path": profilePath,
        "combined_credits": combinedCredits?.toMap(),
        "external_ids": externalIds?.toMap(),
        "images": images?.toMap(),
        "movie_credits": movieCredits?.toMap(),
        "tagged_images": taggedImages?.toMap(),
        "tv_credits": tvCredits?.toMap(),
      };
}

class CombinedCredits extends PeopleEntityCombinedCredits {
  const CombinedCredits({
    super.cast,
    super.crew,
  });

  factory CombinedCredits.fromMap(Map<String, dynamic> json) => CombinedCredits(
        cast: json["cast"] == null
            ? []
            : List<CombinedCreditsCast>.from(
                json["cast"]!.map((x) => CombinedCreditsCast.fromMap(x))),
        crew: json["crew"] == null
            ? []
            : List<CombinedCreditsCast>.from(
                json["crew"]!.map((x) => CombinedCreditsCast.fromMap(x))),
      );

  @override
  Map<String, dynamic> toMap() => {
        "cast":
            cast == null ? [] : List<dynamic>.from(cast!.map((x) => x.toMap())),
        "crew":
            crew == null ? [] : List<dynamic>.from(crew!.map((x) => x.toMap())),
      };
}

class CombinedCreditsCast extends PeopleEntityCombinedCreditsCast {
  const CombinedCreditsCast({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
    super.character,
    super.creditId,
    super.order,
    super.mediaType,
    super.originCountry,
    super.originalName,
    super.firstAirDate,
    super.name,
    super.episodeCount,
    super.department,
    super.job,
  });

  factory CombinedCreditsCast.fromMap(Map<String, dynamic> json) =>
      CombinedCreditsCast(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        mediaType: json["media_type"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalName: json["original_name"],
        firstAirDate: json["first_air_date"],
        name: json["name"],
        episodeCount: json["episode_count"],
        department: json["department"],
        job: json["job"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "media_type": mediaType,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_name": originalName,
        "first_air_date": firstAirDate,
        "name": name,
        "episode_count": episodeCount,
        "department": department,
        "job": job,
      };
}

class ExternalIds extends PeopleEntityExternalIds {
  const ExternalIds({
    super.freebaseMid,
    super.freebaseId,
    super.imdbId,
    super.tvrageId,
    super.wikidataId,
    super.facebookId,
    super.instagramId,
    super.tiktokId,
    super.twitterId,
    super.youtubeId,
  });

  factory ExternalIds.fromMap(Map<String, dynamic> json) => ExternalIds(
        freebaseMid: json["freebase_mid"],
        freebaseId: json["freebase_id"],
        imdbId: json["imdb_id"],
        tvrageId: json["tvrage_id"],
        wikidataId: json["wikidata_id"],
        facebookId: json["facebook_id"],
        instagramId: json["instagram_id"],
        tiktokId: json["tiktok_id"],
        twitterId: json["twitter_id"],
        youtubeId: json["youtube_id"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "freebase_mid": freebaseMid,
        "freebase_id": freebaseId,
        "imdb_id": imdbId,
        "tvrage_id": tvrageId,
        "wikidata_id": wikidataId,
        "facebook_id": facebookId,
        "instagram_id": instagramId,
        "tiktok_id": tiktokId,
        "twitter_id": twitterId,
        "youtube_id": youtubeId,
      };
}

class Images extends PeopleEntityImages {
  const Images({
    super.profiles,
  });

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        profiles: json["profiles"] == null
            ? []
            : List<Profile>.from(
                json["profiles"]!.map((x) => Profile.fromMap(x))),
      );

  @override
  Map<String, dynamic> toMap() => {
        "profiles": profiles == null
            ? []
            : List<dynamic>.from(profiles!.map((x) => x.toMap())),
      };
}

class Profile extends PeopleEntityProfile {
  const Profile({
    super.aspectRatio,
    super.height,
    super.iso6391,
    super.filePath,
    super.voteAverage,
    super.voteCount,
    super.width,
  });

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
      };
}

class MovieCredits extends PeopleEntityMovieCredits {
  const MovieCredits({
    super.cast,
    super.crew,
  });

  factory MovieCredits.fromMap(Map<String, dynamic> json) => MovieCredits(
        cast: json["cast"] == null
            ? []
            : List<MovieCreditsCast>.from(
                json["cast"]!.map((x) => MovieCreditsCast.fromMap(x))),
        crew: json["crew"] == null
            ? []
            : List<MovieCreditsCast>.from(
                json["crew"]!.map((x) => MovieCreditsCast.fromMap(x))),
      );

  @override
  Map<String, dynamic> toMap() => {
        "cast":
            cast == null ? [] : List<dynamic>.from(cast!.map((x) => x.toMap())),
        "crew":
            crew == null ? [] : List<dynamic>.from(crew!.map((x) => x.toMap())),
      };
}

class MovieCreditsCast extends PeopleEntityMovieCreditsCast {
  const MovieCreditsCast({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
    super.character,
    super.creditId,
    super.order,
    super.department,
    super.job,
  });

  factory MovieCreditsCast.fromMap(Map<String, dynamic> json) =>
      MovieCreditsCast(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
      };
}

class TaggedImages extends PeopleEntityTaggedImages {
  const TaggedImages({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  factory TaggedImages.fromMap(Map<String, dynamic> json) => TaggedImages(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result extends PeopleEntityResult {
  const Result({
    super.aspectRatio,
    super.filePath,
    super.height,
    super.id,
    super.iso6391,
    super.voteAverage,
    super.voteCount,
    super.width,
    super.imageType,
    super.media,
    super.mediaType,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        filePath: json["file_path"],
        height: json["height"],
        id: json["id"],
        iso6391: json["iso_639_1"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
        imageType: json["image_type"],
        media: json["media"] == null ? null : Media.fromMap(json["media"]),
        mediaType: json["media_type"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "aspect_ratio": aspectRatio,
        "file_path": filePath,
        "height": height,
        "id": id,
        "iso_639_1": iso6391,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
        "image_type": imageType,
        "media": media?.toMap(),
        "media_type": mediaType,
      };
}

class Media extends PeopleEntityMedia {
  const Media({
    super.id,
    super.overview,
    super.mediaType,
    super.name,
    super.voteAverage,
    super.voteCount,
    super.airDate,
    super.episodeNumber,
    super.episodeType,
    super.productionCode,
    super.runtime,
    super.seasonNumber,
    super.showId,
    super.stillPath,
    super.backdropPath,
    super.originalTitle,
    super.posterPath,
    super.adult,
    super.title,
    super.originalLanguage,
    super.genreIds,
    super.popularity,
    super.releaseDate,
    super.video,
  });

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        id: json["id"],
        overview: json["overview"],
        mediaType: json["media_type"],
        name: json["name"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        airDate: json["air_date"],
        episodeNumber: json["episode_number"],
        episodeType: json["episode_type"],
        productionCode: json["production_code"],
        runtime: json["runtime"],
        seasonNumber: json["season_number"],
        showId: json["show_id"],
        stillPath: json["still_path"],
        backdropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        posterPath: json["poster_path"],
        adult: json["adult"],
        title: json["title"],
        originalLanguage: json["original_language"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: json["release_date"],
        video: json["video"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "overview": overview,
        "media_type": mediaType,
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "air_date": airDate,
        "episode_number": episodeNumber,
        "episode_type": episodeType,
        "production_code": productionCode,
        "runtime": runtime,
        "season_number": seasonNumber,
        "show_id": showId,
        "still_path": stillPath,
        "backdrop_path": backdropPath,
        "original_title": originalTitle,
        "poster_path": posterPath,
        "adult": adult,
        "title": title,
        "original_language": originalLanguage,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "release_date": releaseDate,
        "video": video,
      };
}

class TvCredits extends PeopleEntityTvCredits {
  const TvCredits({
    super.cast,
    super.crew,
  });

  factory TvCredits.fromMap(Map<String, dynamic> json) => TvCredits(
        cast: json["cast"] == null
            ? []
            : List<TvCreditsCast>.from(
                json["cast"]!.map((x) => TvCreditsCast.fromMap(x))),
        crew: json["crew"] == null
            ? []
            : List<TvCreditsCast>.from(
                json["crew"]!.map((x) => TvCreditsCast.fromMap(x))),
      );

  @override
  Map<String, dynamic> toMap() => {
        "cast":
            cast == null ? [] : List<dynamic>.from(cast!.map((x) => x.toMap())),
        "crew":
            crew == null ? [] : List<dynamic>.from(crew!.map((x) => x.toMap())),
      };
}

class TvCreditsCast extends PeopleEntityTvCreditsCast {
  const TvCreditsCast({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originCountry,
    super.originalLanguage,
    super.originalName,
    super.overview,
    super.popularity,
    super.posterPath,
    super.firstAirDate,
    super.name,
    super.voteAverage,
    super.voteCount,
    super.character,
    super.creditId,
    super.episodeCount,
    super.department,
    super.job,
  });

  factory TvCreditsCast.fromMap(Map<String, dynamic> json) => TvCreditsCast(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"],
        name: json["name"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        character: json["character"],
        creditId: json["credit_id"],
        episodeCount: json["episode_count"],
        department: json["department"],
        job: json["job"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date": firstAirDate,
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "character": character,
        "credit_id": creditId,
        "episode_count": episodeCount,
        "department": department,
        "job": job,
      };
}
