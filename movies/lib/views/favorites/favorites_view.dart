import 'package:data/services/storage_service/storage_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/views/favorites/cubit/favorites_cubit.dart';
import 'package:movies/views/widgets/movie_card.dart';

class FavoriteMovies extends StatelessWidget {
  const FavoriteMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: BlocProvider<FavoritesCubit>(
        create: (context) =>
            FavoritesCubit(GetIt.I<IStorageService>())..getFavoriteMovies(),
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesSuccess) {
              return SizedBox(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      return MovieCard(
                          imageUrl: state.movies[index].backdropPath!,
                          id: state.movies[index].id.toString());
                    }),
              );
            } else if (state is FavoritesFailure) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
