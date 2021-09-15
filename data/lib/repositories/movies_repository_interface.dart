import 'package:data/models/director_model.dart';
import 'package:data/models/movie_by_director_model.dart';
import 'package:data/models/movie_model.dart';
import 'package:data/utils/query_enum.dart';

abstract class IMoviesRepository{

  Future<List<MovieModel>> getMoviesByFilter({int page = 1});

  Future<List<MovieModel>> getMovies(QueryEnum searchType, int page);

  // Future<List<DirectorModel>> getFemaleDirectors();

  // Future<List<MovieByDirectorModel>> getMoviesByDirectors();
}