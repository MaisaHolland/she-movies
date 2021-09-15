import 'package:bloc/bloc.dart';
import 'package:data/models/movie_model.dart';
import 'package:data/services/storage_service/storage_service_interface.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final IStorageService storageService;
  FavoritesCubit(this.storageService) : super(FavoritesLoading());

  void getFavoriteMovies() async {
    var movies = await storageService.getFavoriteMovies();
    if(movies.isNotEmpty)emit(FavoritesSuccess(movies));
    else emit(FavoritesFailure("Você não possui favoritos!"));
  }
}
