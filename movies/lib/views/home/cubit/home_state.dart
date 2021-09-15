
part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  List<MovieModel>? get topRatedMovies => null;
  List<MovieModel>? get nowPlayingMovies => null;
  List<MovieModel>? get popularMovies => null;
}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<MovieModel>? nowPlayingMovies;
  final List<MovieModel>? topRatedMovies;
  final List<MovieModel>? popularMovies;

  HomeSuccess(this.nowPlayingMovies, this.topRatedMovies, this.popularMovies);

}
class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}
