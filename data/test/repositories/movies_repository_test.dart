import 'dart:convert';

import 'package:data/models/movie_model.dart';
import 'package:data/repositories/movies_repository_interface.dart';
import 'package:data/utils/query_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils.dart';

class MoviesRepositoryMock extends Mock implements IMoviesRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final repository = MoviesRepositoryMock();
  late List<MovieModel> movies;
  late List<Map<String, dynamic>> data;

  setUp(() async {
    data = await loadMockFromAssets("movies");
    when(() => repository.getMovies(QueryEnum.POPULAR, 1))
        .thenAnswer((_) => Future((){
      return (data).map((e) => MovieModel.fromJson(e)).toList();
    }));
  });

  test("Should return a list of movies", () async {

    movies = await repository.getMovies(QueryEnum.POPULAR, 1);

    expect(movies.isNotEmpty, true);

    expect(movies.first.title, "Promising Young Woman");
  });
}
