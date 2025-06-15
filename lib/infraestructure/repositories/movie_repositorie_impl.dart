import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repositorie.dart';
import 'package:cinemapedia/infraestructure/datasources/moviedb_datasource.dart';

class MovieRepositorieImpl extends MoviesRepositorie {
  final MoviesDatasource datasource;

  MovieRepositorieImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
