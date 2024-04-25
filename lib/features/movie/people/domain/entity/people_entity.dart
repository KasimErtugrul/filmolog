// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PeopleEntity extends Equatable {
  final bool? adult;
  final List<String>? alsoKnownAs;
  final String? biography;
  final String? birthday;
  final dynamic deathday;
  final int? gender;
  final dynamic homepage;
  final int? id;
  final String? imdbId;
  final String? knownForDepartment;
  final String? name;
  final String? placeOfBirth;
  final double? popularity;
  final String? profilePath;
  final PeopleEntityCombinedCredits? combinedCredits;
  final PeopleEntityExternalIds? externalIds;
  final PeopleEntityImages? images;
  final PeopleEntityMovieCredits? movieCredits;
  final PeopleEntityTaggedImages? taggedImages;
  final PeopleEntityTvCredits? tvCredits;

  const PeopleEntity({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
    this.combinedCredits,
    this.externalIds,
    this.images,
    this.movieCredits,
    this.taggedImages,
    this.tvCredits,
  });
Map<String, dynamic> toMap() => {
        "adult": adult,
        "also_known_as": alsoKnownAs == null ? [] : List<dynamic>.from(alsoKnownAs!.map((x) => x)),
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
  @override
  List<Object?> get props {
    return [
      adult,
      alsoKnownAs,
      biography,
      birthday,
      deathday,
      gender,
      homepage,
      id,
      imdbId,
      knownForDepartment,
      name,
      placeOfBirth,
      popularity,
      profilePath,
      combinedCredits,
      externalIds,
      images,
      movieCredits,
      taggedImages,
      tvCredits,
    ];
  }
}

class PeopleEntityCombinedCredits extends Equatable {
  final List<PeopleEntityCombinedCreditsCast>? cast;
  final List<PeopleEntityCombinedCreditsCast>? crew;

  const PeopleEntityCombinedCredits({
    this.cast,
    this.crew,
  });
 Map<String, dynamic> toMap() => {
        "cast": cast == null ? [] : List<dynamic>.from(cast!.map((x) => x.toMap())),
        "crew": crew == null ? [] : List<dynamic>.from(crew!.map((x) => x.toMap())),
    };
  @override
  List<Object?> get props => [cast, crew];
}

class PeopleEntityCombinedCreditsCast extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? character;
  final String? creditId;
  final int? order;
  final String? mediaType;
  final List<String>? originCountry;
  final String? originalName;
  final String? firstAirDate;
  final String? name;
  final int? episodeCount;
  final String? department;
  final String? job;

  const PeopleEntityCombinedCreditsCast({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.character,
    this.creditId,
    this.order,
    this.mediaType,
    this.originCountry,
    this.originalName,
    this.firstAirDate,
    this.name,
    this.episodeCount,
    this.department,
    this.job,
  });
Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
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
        "origin_country": originCountry == null ? [] : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_name": originalName,
        "first_air_date": firstAirDate,
        "name": name,
        "episode_count": episodeCount,
        "department": department,
        "job": job,
    };
  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount,
      character,
      creditId,
      order,
      mediaType,
      originCountry,
      originalName,
      firstAirDate,
      name,
      episodeCount,
      department,
      job,
    ];
  }
}

class PeopleEntityExternalIds extends Equatable {
  final String? freebaseMid;
  final String? freebaseId;
  final String? imdbId;
  final int? tvrageId;
  final String? wikidataId;
  final String? facebookId;
  final String? instagramId;
  final String? tiktokId;
  final String? twitterId;
  final String? youtubeId;

  const PeopleEntityExternalIds({
    this.freebaseMid,
    this.freebaseId,
    this.imdbId,
    this.tvrageId,
    this.wikidataId,
    this.facebookId,
    this.instagramId,
    this.tiktokId,
    this.twitterId,
    this.youtubeId,
  });
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
  @override
  List<Object?> get props {
    return [
      freebaseMid,
      freebaseId,
      imdbId,
      tvrageId,
      wikidataId,
      facebookId,
      instagramId,
      tiktokId,
      twitterId,
      youtubeId,
    ];
  }
}

class PeopleEntityImages extends Equatable {
  final List<PeopleEntityProfile>? profiles;

  const PeopleEntityImages({
    this.profiles,
  });
 Map<String, dynamic> toMap() => {
        "profiles": profiles == null ? [] : List<dynamic>.from(profiles!.map((x) => x.toMap())),
    };
  @override
  List<Object?> get props => [profiles];
}

class PeopleEntityProfile extends Equatable {
  final double? aspectRatio;
  final int? height;
  final dynamic iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  const PeopleEntityProfile({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });
 Map<String, dynamic> toMap() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
    };
  @override
  List<Object?> get props {
    return [
      aspectRatio,
      height,
      iso6391,
      filePath,
      voteAverage,
      voteCount,
      width,
    ];
  }
}

class PeopleEntityMovieCredits extends Equatable {
  final List<PeopleEntityMovieCreditsCast>? cast;
  final List<PeopleEntityMovieCreditsCast>? crew;

  const PeopleEntityMovieCredits({
    this.cast,
    this.crew,
  });
Map<String, dynamic> toMap() => {
        "cast": cast == null ? [] : List<dynamic>.from(cast!.map((x) => x.toMap())),
        "crew": crew == null ? [] : List<dynamic>.from(crew!.map((x) => x.toMap())),
    };
  @override
  List<Object?> get props => [cast, crew];
}

class PeopleEntityMovieCreditsCast extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? character;
  final String? creditId;
  final int? order;
  final String? department;
  final String? job;

  const PeopleEntityMovieCreditsCast({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });
 Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
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
  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount,
      character,
      creditId,
      order,
      department,
      job,
    ];
  }
}

class PeopleEntityTaggedImages extends Equatable {
  final int? page;
  final List<PeopleEntityResult>? results;
  final int? totalPages;
  final int? totalResults;

  const PeopleEntityTaggedImages({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
 Map<String, dynamic> toMap() => {
        "page": page,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

class PeopleEntityResult extends Equatable {
  final double? aspectRatio;
  final String? filePath;
  final int? height;
  final String? id;
  final String? iso6391;
  final double? voteAverage;
  final int? voteCount;
  final int? width;
  final String? imageType;
  final PeopleEntityMedia? media;
  final String? mediaType;

  const PeopleEntityResult({
    this.aspectRatio,
    this.filePath,
    this.height,
    this.id,
    this.iso6391,
    this.voteAverage,
    this.voteCount,
    this.width,
    this.imageType,
    this.media,
    this.mediaType,
  });
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
  @override
  List<Object?> get props {
    return [
      aspectRatio,
      filePath,
      height,
      id,
      iso6391,
      voteAverage,
      voteCount,
      width,
      imageType,
      media,
      mediaType,
    ];
  }
}

class PeopleEntityMedia extends Equatable {
  final int? id;
  final String? overview;
  final String? mediaType;
  final String? name;
  final double? voteAverage;
  final int? voteCount;
  final String? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final int? showId;
  final String? stillPath;
  final String? backdropPath;
  final String? originalTitle;
  final String? posterPath;
  final bool? adult;
  final String? title;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;

  const PeopleEntityMedia({
    this.id,
    this.overview,
    this.mediaType,
    this.name,
    this.voteAverage,
    this.voteCount,
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.backdropPath,
    this.originalTitle,
    this.posterPath,
    this.adult,
    this.title,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
  });
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
        "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "release_date": releaseDate,
        "video": video,
    };
  @override
  List<Object?> get props {
    return [
      id,
      overview,
      mediaType,
      name,
      voteAverage,
      voteCount,
      airDate,
      episodeNumber,
      episodeType,
      productionCode,
      runtime,
      seasonNumber,
      showId,
      stillPath,
      backdropPath,
      originalTitle,
      posterPath,
      adult,
      title,
      originalLanguage,
      genreIds,
      popularity,
      releaseDate,
      video,
    ];
  }
}

class PeopleEntityTvCredits extends Equatable {
  final List<PeopleEntityTvCreditsCast>? cast;
  final List<PeopleEntityTvCreditsCast>? crew;

  const PeopleEntityTvCredits({
    this.cast,
    this.crew,
  });
Map<String, dynamic> toMap() => {
        "cast": cast == null ? [] : List<dynamic>.from(cast!.map((x) => x.toMap())),
        "crew": crew == null ? [] : List<dynamic>.from(crew!.map((x) => x.toMap())),
    };
  @override
  List<Object?> get props => [cast, crew];
}

class PeopleEntityTvCreditsCast extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;
  final String? character;
  final String? creditId;
  final int? episodeCount;
  final String? department;
  final String? job;

  const PeopleEntityTvCreditsCast({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
    this.character,
    this.creditId,
    this.episodeCount,
    this.department,
    this.job,
  });
 Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "origin_country": originCountry == null ? [] : List<dynamic>.from(originCountry!.map((x) => x)),
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
  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      firstAirDate,
      name,
      voteAverage,
      voteCount,
      character,
      creditId,
      episodeCount,
      department,
      job,
    ];
  }
}
