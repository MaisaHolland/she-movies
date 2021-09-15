import 'package:data/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:movies/views/widgets/hero_dialog.dart';

class MovieDetails extends StatefulWidget {
  final MovieModel movie;
  final String id;
  final void Function() onFavoritePressed;

  const MovieDetails(
      {Key? key,
      required this.movie,
      required this.id,
      required this.onFavoritePressed})
      : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      insetPadding: const EdgeInsets.all(0),
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade700,
            borderRadius: BorderRadius.circular(20)),
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ListView(
          children: [
            Container(
              child: Hero(
                tag: widget.id,
                child: Image.network(widget.movie.backdropPath!),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [_title(), _favoriteButton()],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _infos(),
                  SizedBox(
                    height: 20,
                  ),
                  _overview()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _overview() {
    return Text(
      widget.movie.overview ?? "",
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Colors.grey.shade300, fontSize: 18),
    );
  }

  Row _infos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _textContent(widget.movie.releaseDate!),
        _textContent(widget.movie.originalLanguage!),
        _textContent(widget.movie.voteAverage.toString()),
      ],
    );
  }

  IconButton _favoriteButton() {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
          widget.onFavoritePressed();
        },
        icon: Icon(
          Icons.favorite,
          color: isFavorite ? Colors.red : Colors.black,
        ));
  }

  SizedBox _title() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Align(
        alignment: Alignment.centerLeft,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            widget.movie.title!,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.bold, color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }

  Text _textContent(String data) => Text(
        data,
        style: TextStyle(color: Colors.white),
      );
}
