import 'dart:async';

import 'package:data/models/director_model.dart';
import 'package:data/models/movie_by_director_model.dart';
import 'package:data/models/movie_model.dart';
import 'package:data/services/tmdb_api.dart';
import 'package:data/utils/query_enum.dart';
import 'package:dio/dio.dart';

import 'movies_repository_interface.dart';

class MoviesRepository extends IMoviesRepository {
  final Dio dio = Dio();
  final TMDBApi api = TMDBApi();

  Future<int> getLastDirectorId() async {
    try {
      Response response = await dio.get(
          "${api.baseUrl}person/latest?api_key=${api.apiKey}&language=en-US");
      return int.parse(response.data["id"]);
    } on DioError catch (e) {
      print(e.message);
      throw e.message;
    }
  }

  Future<List<MovieModel>?>? getMovies(QueryEnum searchType, int page) async {
    var type = "";
    switch (searchType) {
      case QueryEnum.POPULAR:
        type = "top_rated";
        break;
      case QueryEnum.NOW_PLAYING:
        type = "now_playing";
        break;
      default:
        type = "popular";
        break;
    }
    try {
      Response response = await dio.get(
          "${api.baseUrl}movie/$type?api_key=${api.apiKey}&language=en-US&page=${page.toString()}");
      var movieList = (response.data["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movieList;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  //TODO ADD FILTERS (It's necessary to get the genres ID first)
  Future<List<MovieModel>> getMoviesByFilter({int page = 1})async {
    var sortQuery = "popularity.desc";
    var url =
        "${api.baseUrl}discover/movie?api_key=${api.apiKey}&language=en-US&sort_by=$sortQuery&include_adult=false&include_video=false&page=${page.toString()}&with_watch_monetization_types=flatrate";
    try {
      Response response = await dio.get(
          url);
      var movieList = (response.data["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movieList;
    } on DioError catch (e) {
      throw e.message;
    }
  }

// Future<List<DirectorModel>> getFemaleDirectors() {}

// Future<List<MovieByDirectorModel>> getMoviesByDirectors() {}
}
