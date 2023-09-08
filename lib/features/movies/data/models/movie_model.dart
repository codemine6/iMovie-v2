import 'package:imovie/core/resources/genre.dart';
import 'package:imovie/features/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    int? id,
    String? backdropPath,
    List<String>? genres,
    String? posterPath,
    String? releaseDate,
    String? title,
    double? voteAverage,
  }) : super(
          id: id,
          backdropPath: backdropPath,
          genres: genres,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          voteAverage: voteAverage,
        );

  factory MovieModel.fromJson(Map<String, dynamic> data) {
    final genres = (data['genre_ids'] as List).map((e) {
      return Genre.genres.firstWhere((element) => element.id == e).name;
    }).toList();

    return MovieModel(
      id: data['id'],
      backdropPath: data['backdrop_path'],
      genres: genres,
      posterPath: data['poster_path'],
      title: data['title'],
      voteAverage: data['vote_average'].toDouble(),
    );
  }
}
