
import 'package:bloc/bloc.dart';
import 'package:data/models/movie_model.dart';
import 'package:data/repositories/movies_repository_interface.dart';
import 'package:data/services/storage_service/storage_service_interface.dart';
import 'package:data/utils/query_enum.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  final IMoviesRepository moviesRepository;
  final IStorageService storageService;

  int page = 1;

  HomeCubit(this.moviesRepository, this.storageService) : super(HomeLoading());


  void loadMovies() async {
    try{
      var popular = await moviesRepository.getMovies(QueryEnum.POPULAR, page);
      var top = await moviesRepository.getMovies(QueryEnum.TOP_RATED, page);
      var now = await moviesRepository.getMovies(QueryEnum.NOW_PLAYING, page);
      var movies = await storageService.getFavoriteMovies();
      if(movies.isNotEmpty){
        print(movies.first.toJson().toString());
      }
      emit(HomeSuccess(now, top, popular));
    } catch (e){
      print(e);
      emit(HomeFailure(e.toString()));
    }
  }

  void setFavorite(MovieModel movie) {
    storageService.setFavoriteMovie(movie);
  }

}
