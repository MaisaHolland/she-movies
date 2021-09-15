import 'package:bloc_test/bloc_test.dart';
import 'package:data/models/movie_model.dart';
import 'package:data/repositories/movies_repository_interface.dart';
import 'package:data/services/storage_service/storage_service_interface.dart';
import 'package:data/utils/query_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/views/home/cubit/home_cubit.dart';

import '../../utils/movies_mock.dart';
//TODO add equatable to cubits states!
class MovieRepositoryMock extends Mock implements IMoviesRepository {}

class StorageServiceMock extends Mock implements IStorageService {}

void main() {
  final repository = MovieRepositoryMock();
  final storageService = StorageServiceMock();
  final movies =
      MOVIES.map((movie) => MovieModel.fromJson(movie)).toList();

  // blocTest<HomeCubit, HomeState>(
  //   "Should return movies list",
  //   build: () {
  //     when(() => repository.getMovies(QueryEnum.POPULAR, 1))
  //         .thenAnswer((invocation) => Future(()=>movies));
  //     return HomeCubit(repository, storageService);
  //   },
  //   act: (bloc) => bloc.loadMovies(),
  //   wait: const Duration(milliseconds: 300),
  //   expect: () => [
  //     HomeSuccess(movies, movies, movies),
  //   ]
  // );
}
