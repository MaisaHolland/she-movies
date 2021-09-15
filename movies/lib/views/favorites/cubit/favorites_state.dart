part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {
  String get message => "";
  List<MovieModel>? get movies => null;
}

class FavoritesLoading extends FavoritesState {}
class FavoritesSuccess extends FavoritesState {
  final List<MovieModel> movies;

  FavoritesSuccess(this.movies);
}
class FavoritesFailure extends FavoritesState {
  final String message;

  FavoritesFailure(this.message);
}
