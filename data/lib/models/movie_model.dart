class MovieModel {
  String? backdropPath;
  List<int>? genreIds;
  late int id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;
  int? voteCount;

  MovieModel(
      {
        required this.id,
        this.backdropPath,
        this.genreIds,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.voteAverage,
        this.voteCount});

  MovieModel.fromJson(Map<String, dynamic> json) {
    var baseImageUrl = "http://image.tmdb.org/t/p/w500";
    backdropPath = baseImageUrl+json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = int.parse(json['id'].toString());
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = double.parse(json['popularity'].toString());
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = double.parse(json['vote_average'].toString());
    voteCount = int.parse(json['vote_count'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}