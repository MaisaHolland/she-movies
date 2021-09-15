import 'dart:convert';

import 'package:data/models/movie_model.dart';
import 'package:data/services/storage_service/storage_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedStorageService extends IStorageService {
  SharedStorageService();

  @override
  Future<List<MovieModel>> getFavoriteMovies() async {
    final prefs = await SharedPreferences.getInstance();
    var moviesData = prefs.getStringList('favorite_movies') ?? [];
    List<MovieModel> movies = [];
    if (moviesData.isNotEmpty) {
      movies = moviesData.map((movieData) {
        return MovieModel.fromJson(jsonDecode(movieData));
      }).toList();
    }
    return Future(()=>movies);
  }

  @override
  void setFavoriteMovie(MovieModel movie) async {
    final prefs = await SharedPreferences.getInstance();
    var moviesMap = jsonEncode(movie.toJson());
    var movies = await getFavoriteMovies();

    List<String> stringList = [];
    stringList = movies.map((e) => jsonEncode(e.toJson())).toList();
    stringList.add(moviesMap);

    var noRepetition = stringList.toSet().toList();

    prefs.setStringList("favorite_movies", noRepetition);
  }
}
