class MovieByDirectorModel {
  String? backdropPath;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  String? title;
  String? overview;
  String? releaseDate;
  int? id;

  MovieByDirectorModel(
      {
        this.backdropPath,
        this.originalLanguage,
        this.originalTitle,
        this.posterPath,
        this.title,
        this.overview,
        this.releaseDate,
        this.id,});

  MovieByDirectorModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    title = json['title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['title'] = this.title;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['id'] = this.id;
    return data;
  }
}
