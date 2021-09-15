import 'package:data/models/movie_model.dart';

abstract class IStorageService{
  void setFavoriteMovie(MovieModel movie);
  Future<List<MovieModel>> getFavoriteMovies();
}